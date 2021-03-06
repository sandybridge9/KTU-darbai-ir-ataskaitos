#include "astexec.h"
#include "astgen.h"
#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <vector>
#include <ctime>
#include <chrono>
#include <iostream>
using std::vector;

struct variable
{
	int type = 0; // 1 - number_const, 2 - string_const, 3 - number_variable, 4 - string_variable, 5 - boolean value, 6 - function parameter
	char* actualType;
	char* name;
	char* strVal;
	float numVal = 0;
	bool state = false;
};

struct function
{
	char* data_type;
	char* name;
	AstElement* parametersListAst;
	vector <variable> parametersList;
	AstElement* statements;
};

struct ExecEnviron
{
	vector <variable> variables;
	vector <function> functions;
	//int x; /* The value of the x variable, a real language would have some name->value lookup table instead */
};
struct ExecEnviron* createEnv();
void execAst(struct ExecEnviron* e, struct AstElement* a);
void freeEnv(struct ExecEnviron* e);
static variable valueExecs(struct ExecEnviron* e, struct AstElement* a);
static variable execExpByNumber(struct ExecEnviron* e, struct AstElement* a);
static variable execExpByString(struct ExecEnviron* e, struct AstElement* a);
static variable execExpByName(struct ExecEnviron* e, struct AstElement* a);
static variable execBinaryExp(struct ExecEnviron* e, struct AstElement* a);
static void execIncreaseExp(struct ExecEnviron* e, struct AstElement* a);
static void execDecreaseExp(struct ExecEnviron* e, struct AstElement* a);
static bool execBooleanExp(struct ExecEnviron* e, struct AstElement* a);
static void runnableExecs(struct ExecEnviron* e, struct AstElement* a);
static void execDeclaration(struct ExecEnviron* e, struct AstElement* a);
static void execAssignment(struct ExecEnviron* e, struct AstElement* a);
static void execStatements(struct ExecEnviron* e, struct AstElement* a);
static void execWhile(struct ExecEnviron* e, struct AstElement* a);
static void execIf(struct ExecEnviron* e, struct AstElement* a);
static void execElif(struct ExecEnviron* e, struct AstElement* a);
static void execElseIf(struct ExecEnviron* e, struct AstElement* a);
static void functionDeclaration(struct ExecEnviron* e, struct AstElement* a);
static void functionCall(struct ExecEnviron* e, struct AstElement* a);
static variable functionArgument(struct ExecEnviron* e, struct AstElement* a);
static variable functionCallArgument(struct ExecEnviron* e, struct AstElement* a);
static variable functionCallArgument2(struct ExecEnviron* e, struct AstElement* a);
static variable functionCallArgument3(struct ExecEnviron* e, struct AstElement* a);
static variable functionReturnStatement(struct ExecEnviron* e, struct AstElement* a);
static void functionCallWithoutParameters(struct ExecEnviron* e, struct AstElement* a);
//static void execCall(struct ExecEnviron* e, struct AstElement* a);

//
//
//
//Method responsible for getting the value of expression
static variable valueExecs(struct ExecEnviron* e, struct AstElement* a)
{
	printf("-value_execs-");
	if (a->operation == 3) 
	{
		variable var = execExpByNumber(e, a);
		printf(" %f ", var.numVal);
		return var;
	}
	else if (a->operation == 4) 
	{
		variable var = execExpByString(e, a);
		printf(" %s ", var.strVal);
		return var;
	}
	else if (a->operation == 5)
	{
		variable var = execExpByName(e, a);
		printf(" %s ", var.name);
		return var;
	}
	else if (a->operation == 6) 
	{
		variable var = execBinaryExp(e, a);
		printf(" %f ", var.numVal);
		return var;
	}
	else if (a->operation == 18)
	{
		variable var = functionArgument(e, a);
		printf(" %s ", var.name);
		return var;
	}
	else if (a->operation == 23)
	{
		variable var = functionReturnStatement(e, a);
		//printf(" %s ", var.name);
		return var;
	}
	else if (a->operation == 24)
	{
		variable var = functionCallArgument(e, a);
		printf(" %s ", var.name);
		return var;
	}
	else if (a->operation == 25)
	{
		variable var = functionCallArgument2(e, a);
		printf(" %s ", var.strVal);
		return var;
	}
	else if (a->operation == 26)
	{
		variable var = functionCallArgument3(e, a);
		printf(" %f ", var.numVal);
		return var;
	}
}

//returns a number value
static variable execExpByNumber(struct ExecEnviron* e, struct AstElement* a) 
{
	printf(" number_const ");
	variable var;
	var.type = 1;
	var.numVal = a->data.expByNum.val;
	return var;
}

//returns a string value
static variable execExpByString(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" string_const ");
	variable var;
	var.type = 2;
	var.strVal = a->data.expByString.val;
	return var;
}

//finds a variable with a matching name and returns it
static variable execExpByName(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" name_identifier ");
	variable var;
	var.name = a->data.expByName.name;
	for (variable v : e->variables)
	{
		if (strcmp(v.name, var.name) == 0)
		{
			var = v;
			break;
		}
	}
	return var; 
}

//increases number variable's value by 1
static void execIncreaseExp(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" increase_op ");
	char* name = a->data.expByName.name;
	for (variable v : e->variables)
	{
		if (strcmp(v.name, name) == 0)
		{
			if (v.actualType == "number")
			{
				v.numVal = v.numVal + 1;
				break;
			}
			
		}
	}
}

//decreases number variable's value by 1
static void execDecreaseExp(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" decrease op");
	char* name = a->data.expByName.name;
	for (variable v : e->variables)
	{
		if (v.name == name)
		{
			if (v.actualType == "number")
			{
				v.numVal = v.numVal + 1;
				break;
			}

		}
	}
}

//Executes binary operations and returns a number
static variable execBinaryExp(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" binary exp ");
	variable left = valueExecs(e, a->data.expression.left);
	variable right = valueExecs(e, a->data.expression.right);
	if ((left.type == 1  || left.type == 3) && (right.type == 1 || left.type == 3)) {
		printf("|%s|", a->data.expression.op);
		if (strcmp(a->data.expression.op, "+") == 0) {
			variable ans;
			ans.type = 1; //ans is a number
			ans.numVal = left.numVal + right.numVal;
			return ans;
		}
		else if (strcmp(a->data.expression.op, "-") == 0) {
			variable ans;
			ans.type = 1; //ans is a number
			ans.numVal = left.numVal - right.numVal;
			return ans;
		}
		else if (strcmp(a->data.expression.op, "*") == 0) {
			variable ans;
			ans.type = 1; //ans is a number
			ans.numVal = left.numVal * right.numVal;
			return ans;
		}
		else if (strcmp(a->data.expression.op, "/") == 0) {
			variable ans;
			ans.type = 1; //ans is a number
			ans.numVal = left.numVal / right.numVal;
			return ans;
		}
		/*
		else if (a->data.expression.op = "%") {
			variable ans;
			ans.numVal = left.numVal % right.numVal;
			return ans;
		}
		*/
	}
}

//Executes Boolean expressions
static bool execBooleanExp(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" boolean exp");
	variable left = valueExecs(e, a->data.booleanOperation.left);
	variable right = valueExecs(e, a->data.booleanOperation.right);
	char* booleanOperator = a->data.booleanOperation.booleanOperator;
	if ((left.type == 1 || left.type == 3) && (right.type == 1 || left.type == 3)) {
		if (strcmp(booleanOperator,"<") == 0) {
			variable ans;
			ans.type = 5; //ans is a bool
			if (left.numVal < right.numVal)
			{
				//ans.state = true;
				//return ans;
				return true;
			}
			else if (left.numVal >= right.numVal)
			{
				//ans.state = false;
				//return ans;
				return false;
			}
		}
		else if (strcmp(booleanOperator, ">") == 0) {
			variable ans;
			ans.type = 5; //ans is a bool
			if (left.numVal > right.numVal)
			{
				//ans.state = true;
				//return ans;
				return true;
			}
			else if (left.numVal <= right.numVal)
			{
				//ans.state = false;
				//return ans;
				return false;
			}
		}
		else if (strcmp(booleanOperator, "==") == 0) {
			variable ans;
			ans.type = 5; //ans is a bool
			if (left.numVal == right.numVal)
			{
				//ans.state = true;
				//return ans;
				return true;
			}
			else if (left.numVal < right.numVal || left.numVal > right.numVal)
			{
				//ans.state = false;
				//return ans;
				return false;
			}
		}
		else if (strcmp(booleanOperator, ">=") == 0) {
			variable ans;
			ans.type = 5; //ans is a bool
			if (left.numVal >= right.numVal)
			{
				//ans.state = true;
				//return ans;
				return true;
			}
			else if (left.numVal < right.numVal)
			{
				//ans.state = false;
				//return ans;
				return false;
			}
		}
		else if (strcmp(booleanOperator, "<=") == 0) {
			variable ans;
			ans.type = 5; //ans is a bool
			if (left.numVal <= right.numVal)
			{
				//ans.state = true;
				//return ans;
				return true;
			}
			else if (left.numVal > right.numVal)
			{
				//ans.state = false;
				//return ans;
				return false;
			}
		}
		/*
		else if (a->data.expression.op = "%") {
			variable ans;
			ans.numVal = left.numVal % right.numVal;
			return ans;
		}
		*/
	}
}

//
//
//
//All runnable actions ( declarations, assignments, statements, while and for loops etc. )
static void runnableExecs(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t -runnable exec-");
	if (a->operation == 1)
	{
		execAssignment(e, a);
	}
	else if (a->operation == 2)
	{
		execDeclaration(e, a);
	}
	else if (a->operation == 7)
	{
		execIncreaseExp(e, a);
	}
	else if (a->operation == 8)
	{
		execDecreaseExp(e, a);
	}
	else if (a->operation == 9)
	{
		execStatements(e, a);
	}
	else if (a->operation == 10)
	{
		execWhile(e, a);
	}
	else if (a->operation == 12)
	{
		execIf(e, a);
	}
	else if (a->operation == 13)
	{
		execElif(e, a);
	}
	else if (a->operation == 14)
	{
		execElseIf(e, a);
	}
	else if (a->operation == 20)
	{
		functionDeclaration(e, a);
	}
	else if (a->operation == 21)
	{
		functionCall(e, a);
	}
	else if (a->operation == 22)
	{
		functionCallWithoutParameters(e, a);
	}

}

//Variable declaration
static void execDeclaration(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t declaration ");
	char* name = a->data.declaration.name;
	char* data_type = a->data.declaration.data_type;
	variable var = valueExecs(e, a->data.declaration.right); // right side value/variable
	var.name = name; // assigns a name to the new variable
	var.actualType = data_type; // assigns a data type to the new variable
	if (strcmp(var.actualType, "string") == 0)
	{
		var.type = 4;
	}
	else if (strcmp(var.actualType, "number") == 0)
	{
		var.type = 3;
	}
	e->variables.push_back(var); // pushes the new variable into the variable array
}

//Value assignment
static void execAssignment(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t assignment ");
	char* name = a->data.assignment.name;
	struct AstElement* r = a->data.assignment.right;
	variable var = valueExecs(e, r); //gets right side value/variable

	for(int i = 0; i < e->variables.size(); i++)
	{
		if (strcmp(e->variables.at(i).name, name) == 0)
		{
			if (e->variables.at(i).type == 3)
			{
				if (var.type == 1 || var.type == 3)
				{
					e->variables.at(i).numVal = var.numVal;
					printf("=-%s-=-%f-=", e->variables.at(i).name, e->variables.at(i).numVal);
					break;
				}
			}
			else if (e->variables.at(i).type == 4)
			{
				if (var.type == 2 || var.type == 4)
				{
					e->variables.at(i).strVal = var.strVal;
					break;
				}
			}
		}
	}

}

//All statement execution
static void execStatements(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" Statements");
	for (int i = 0; i < a->data.statements.count-1; i++)
	{
		runnableExecs(e, a->data.statements.statements[i]);
	}
}

//While statement execution
static void execWhile(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t While");
	struct AstElement* const condition = a->data.whileStmt.cond;
	struct AstElement* const statements = a->data.whileStmt.statements;
	while (execBooleanExp(e, condition))
	{
		printf("--iteration:--");
		runnableExecs(e, statements);
	}
}

//If statement execution
static void execIf(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t IF");
	struct AstElement* const condition = a->data.ifStmt.cond;
	struct AstElement* const statements = a->data.ifStmt.statements;
	if (execBooleanExp(e, condition))
	{
		runnableExecs(e, statements);
	}
}

//Elif statement execution
static void execElif(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t IF Elif");
	struct AstElement* const firstIfCond = a->data.elifStmt.firstIf->data.ifStmt.cond;
	struct AstElement* const firstIfStatements = a->data.elifStmt.firstIf->data.ifStmt.statements;
	struct AstElement* const elifCond = a->data.elifStmt.elseIfCond;
	struct AstElement* const elifStatements = a->data.elifStmt.statements;
	if (execBooleanExp(e, firstIfCond))
	{
		runnableExecs(e, firstIfStatements);
	}
	else if (execBooleanExp(e, elifCond))
	{
		runnableExecs(e, elifStatements);
	}
}

//If Else statement execution
static void execElseIf(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t If Else");
	struct AstElement* const firstIfCond = a->data.elseStmt.firstIf->data.ifStmt.cond;
	struct AstElement* const firstIfStatements = a->data.elseStmt.firstIf->data.ifStmt.statements;
	struct AstElement* const elseStatements = a->data.elseStmt.elseStatements;
	if (execBooleanExp(e, firstIfCond))
	{
		runnableExecs(e, firstIfStatements);
	}
	else
	{
		runnableExecs(e, elseStatements);
	}
}

//Function declaration
static void functionDeclaration(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t Function_Declaration ");
	char* data_type = a->data.functionDeclaration.data_type;
	char* name = a->data.functionDeclaration.name;
	struct AstElement* parametersListAst = a->data.functionDeclaration.argumentsList;
	struct AstElement* statements = a->data.functionDeclaration.statements;
	function func;
	func.data_type = data_type;
	func.name = name;
	func.parametersListAst = parametersListAst;
	func.statements = statements;
	vector<variable> parametersList;
	for (int i = 0; i < parametersListAst->data.argumentList.count; i++)
	{
		variable param = valueExecs(e, parametersListAst->data.argumentList.arguments[i]);
		parametersList.push_back(param);
	}
	func.parametersList = parametersList;
	e->functions.push_back(func);
}

//Function call
static void functionCall(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t Function call ");
	char* name = a->data.functionCall.name;
	struct AstElement* argumentsList = a->data.functionCall.parameters;
	function func;
	//Function call parameters
	vector<variable> parametersList;
	printf(name);
	for (int i = 0; i < argumentsList->data.argumentList.count; i++)
	{
		variable param = valueExecs(e, argumentsList->data.argumentList.arguments[i]);
		parametersList.push_back(param);
	}
	if (strcmp(name, "print") == 0) // print function
	{
		for (int i = 0; i < parametersList.size(); i++)
		{			
			variable param = parametersList.at(i);
			if(param.type == 2)
			{
				printf(param.strVal);
			}
			else if (param.type == 1)
			{
				printf("%f", param.numVal);
			}
			else if (strcmp(param.actualType, "number") == 0)
			{
				printf("%f", param.numVal);
			}
			else if(strcmp(param.actualType, "string") == 0)
			{
				printf(param.strVal);
			}
		}
	}
	else if (strcmp(name, "time") == 0)
	{
		auto start = std::chrono::system_clock::now();
		// Some computation here
		auto end = std::chrono::system_clock::now();

		std::chrono::duration<double> elapsed_seconds = end - start;
		std::time_t end_time = std::chrono::system_clock::to_time_t(end);

		std::cout << "Current Time: " << std::ctime(&end_time) << "\n";
	}
	else //User made functions
	{
		for (function f : e->functions)
		{
			if (strcmp(f.name, name) == 0)
			{
				func = f;
			}
		}
		AstElement* statements = func.statements; //All function statements
		vector<variable> parametersList2 = func.parametersList; // Function declaration parameters
		bool match = false;
		if (parametersList.size() == parametersList2.size())
		{
			for (int i = 0; i < parametersList.size(); i++)
			{
				if (strcmp(parametersList.at(i).actualType, parametersList2.at(i).actualType) != 0)
				{
					match = false;
					break;
				}
				else
				{
					match = true;
				}
			}
		}
		if (match == true)
		{
			ExecEnviron* e2 = createEnv(); // Function is executed in a new environment
			e2->variables = parametersList; //Assigning parameters to new environment's variables
			execAst(e2, statements); // Funtion execution
			freeEnv(e2);
		}
	}
}

//Function call without parameters
static void functionCallWithoutParameters(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n \t \t Function call without parameters ");
	char* name = a->data.functionCallWithoutParameters.name;
	function func;
	if (strcmp(name, "print") == 0) // print function
	{
		printf("Print can't be called without parameters");
	}
	else if (strcmp(name, "time") == 0)
	{
		auto start = std::chrono::system_clock::now();
		auto end = std::chrono::system_clock::now();
		std::chrono::duration<double> elapsed_seconds = end - start;
		std::time_t end_time = std::chrono::system_clock::to_time_t(end);
		std::cout << "Current Time: " << std::ctime(&end_time) << "\n";
	}
	else //User made functions without parameters
	{
		for (function f : e->functions)
		{
			if (strcmp(f.name, name) == 0)
			{
				func = f;
			}
		}
		if (func.parametersList.size() != 0)
		{
			printf("FUNCTION HAS TO BE CALLED WITH PARAMETERS");
		}
		else
		{
			AstElement* statements = func.statements; //All function statements
			ExecEnviron* e2 = createEnv(); // Function is executed in a new environment
			execAst(e2, statements); // Funtion execution
			freeEnv(e2);
		}

	}
}

//Function argument template
static variable functionArgument(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" argument ");
	char* data_type = a->data.argument.data_type;
	char* name = a->data.argument.name;
	variable var;
	var.actualType = data_type;
	var.name = name;
	var.type = 6;
	return var;
}

//Function call parameter template
static variable functionCallArgument(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" call argument ");
	char* name = a->data.callArgument.name;
	variable var;
	for (int i = 0; i < e->variables.size(); i++)
	{
		if (strcmp(name, e->variables.at(i).name) == 0)
		{
			var = e->variables.at(i);
			return var;
		}
	}
}

//Function call parameter template for string values without identifier
static variable functionCallArgument2(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" call argument2 ");
	char* strVal = a->data.callArgument2.strVal;
	variable var;
	var.type = 2;
	var.strVal = strVal;
	return var;
}

//Function call parameter template for float values without identifier
static variable functionCallArgument3(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" call argument3 ");
	float numVal = a->data.callArgument3.numVal;
	variable var;
	var.type = 1;
	var.numVal = numVal;
	return var;
}

//Return statement
static variable functionReturnStatement(struct ExecEnviron* e, struct AstElement* a)
{
	printf(" return_statement ");
	AstElement* returnExpression = a->data.returnStatement.expression;
	variable var = valueExecs(e, returnExpression);

	return var;
}

//Method that executes given AST
void execAst(struct ExecEnviron* e, struct AstElement* a)
{
	printf("\n----execAst-----");
	runnableExecs(e, a);
}

struct ExecEnviron* createEnv()
{
	//assert(ekLastElement == (sizeof(valExecs) / sizeof(*valExecs)));
	//assert(ekLastElement == (sizeof(runExecs) / sizeof(*runExecs)));
	printf("\n Creating environment");
	ExecEnviron* execEnviron = new ExecEnviron();
	return execEnviron;
}

void freeEnv(struct ExecEnviron* e)
{
	printf("\n freeing environment ");
	//printf("\n ---variable count: %d", e->variables.size());
	printf("\n \t variables:");
	for (variable v : e->variables) {
		printf("\n \t \t name: %s, numVal: %f, type: %d, actualType: %s ---", v.name, v.numVal, v.type, v.actualType);
	}
	free(e);
}