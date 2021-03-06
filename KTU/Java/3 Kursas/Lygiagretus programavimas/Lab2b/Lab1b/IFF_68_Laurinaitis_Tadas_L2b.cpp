//Atsakymai i klausimus: 1.tokia, kokia uzrasyti; 2.atsitiktine; 3.atsitiktini skai£iu; 4. tokia, kokia sura²yti duomenu masyve;

#include "pch.h"
#include <iostream>
#include <omp.h>
#include <string>
#include <fstream>
#include <iomanip>
#include <iterator>
#include <array>
#include <new>
#include <vector>
#include <algorithm>

using namespace std;

class Student {

public:
	string name;
	int threadNumber;
	double salary;
	int count;

public:

	Student() {	}

	Student(string name, int count, double salary) {
		this->name = name;
		this->threadNumber = 0;
		this->salary = salary;
		this->count = count;
	}
	Student(string name, int count) {
		this->name = name;
		this->threadNumber = 0;
		this->salary = 0;
		this->count = count;
	}
	void setCount(int count) {
		this->count = count;
	}
	int getCount() {
		return count;
	}
};

class DataStructure {
public:
	vector<Student> students;
	//Student students[100];
	int count;
	int countMaxSize;
	bool isFinished1;
	bool isFinished2;

public:
	DataStructure() {
		//students = new Student[100]();
		isFinished1 = false;
		isFinished2 = false;
		count = 0;
		countMaxSize = 100;
	}
	void write(vector<Student> forWriting, int threadNum) {
		while (count == countMaxSize) {
			//cout << "Writer threads are waiting" << endl;
		}
#pragma omp critical
		{
			for (int i = 0; i < forWriting.size(); i++) {
				bool exists = false;
				for (int j = 0; j < students.size(); j++) {
					if (students[j].name != "" && forWriting[i].name.compare(students[j].name) == 0) {
						students[j].setCount(students[j].getCount() + 1);
						//cout << "increasing count of " << students[j].name << " by 1. The count is: " << students[j].getCount() << endl;
						exists = true;
						count++;
						break;
					}
				}
				if (exists == false && students.size() > 0) {
					for (int j = 0; j < students.size(); j++) {
						if (forWriting[i].name.compare(students[j].name) > 0) {
							forWriting[i].setCount(1);
							students.push_back(forWriting[i]);
							//cout << "Adding new elements with name: " << forWriting[i].name << " count: "<< forWriting[i].getCount() << endl;
							count++;
							break;
						}
					}
				}
				else if (students.size() == 0) {
					students.push_back(forWriting[i]);
					students[i].setCount(1);
					count++;
					//cout << "Array is empty. Adding new elements with name: " << students[i].name << endl;
				}
			}
			cout << "---------------------------" << endl;
		}

		for (int i = 0; i < students.size(); i++) {
			cout << "Students array " << students[i].name << " COunt: " << students[i].getCount() << endl;
		}
		if (threadNum == 0) {
			isFinished1 = true;
			cout << "Thread 0 finished work" << endl;
		}
		else if (threadNum == 1) {
			isFinished2 = true;
			cout << "Thread 1 finished work" << endl;
		}
	}
	void read(vector<Student> forReading) {
		while (isFinished1 == false || isFinished2 == false) {
			//cout << "im waiting for writing to finish" << endl;
		}
		for (int i = 0; i < forReading.size(); i++) {
			///cout << "yeehaw" << endl;
			int times = forReading[i].getCount();
			//cout << times << " " << forReading[i].name << endl;
			for (int k = 0; k < times; k++) {
				#pragma omp critical
				{
					for (int j = 0; j < students.size(); j++) {
						if (forReading[i].name.compare(students[j].name) == 0) {
							//cout << students.size() << endl;
							if (students[j].getCount() > 1) {
								students[j].setCount(students[j].getCount() - 1);
								//cout << students[j].name << " count: " << students[j].getCount() << endl;
								break;
							}
							else if (students[j].getCount() == 1) {
								if (students.size() > 1) {
									//students.erase(students.begin()+(j-1));
									//cout << students.at(j).name << " would be deleted." << endl;
									//cout << students[j].name << " count: " << students[j].getCount() << " was deleted" << endl;
									//students.erase(students.begin() + (j-1));
									students[j] = Student("", 0, 0);
									//deleteGaps(j);
									break;
								}
								//else if (students.size() <= 1) {
								//	students.clear();
								//}
							}
						}
					}
				}
			}
		}
		//cout << "-----------------" << endl;
		//for (size_t i = 0; i < students.size(); i++)
		//{
		//	if (students[i].name != "") {
		//		cout << students[i].name << " Count: " << students[i].getCount() << endl;
		//	}
		//}
	}

	//void deleteGaps(int index) {
	//	for (int i = index; i < sizeof(students) / sizeof(students[0]) - 1; i++) {
	//		students[i] = students[i + 1];
	//	}
	//	//students[students.length-1] = null;
	//}

	vector<Student> &getStudents() {
		return students;
	}
};

DataStructure structure;

class Writer {

public:
	vector<Student> toWrite;
	int threadNumber;

public:

	Writer(vector<Student> toWrite, int threadNumber) {
		this->toWrite = toWrite;
		this->threadNumber = threadNumber;
	}
	void run() {
		structure.write(toWrite, threadNumber);
	}
};

class Reader {

public:
	vector<Student> toRead;

public:

	Reader(vector<Student> toRead) {
		this->toRead = toRead;
	}
	void run() {
		structure.read(toRead);
	}
};

void readAllData(string file, vector<vector<Student>> &allWriteStudents, vector<vector<Student>> &allReadStudents);
void writeAllData(string file, vector<vector<Student>> &allWriteStudents, vector<vector<Student>> &allReadStudents);

int main(){
	string file = "IFF_68_Laurinaitis_Tadas_L2b_dat3.txt"; // dat1 - viska istrina, dat2 - nieko neistrina, dat3 - istrina dali
	string resultsFile = "IFF_68_Laurinaitis_Tadas_L2b_rez.txt";
	vector<vector<Student>> allWriteStudents;
	vector<vector<Student>> allReadStudents;
	readAllData(file, allWriteStudents, allReadStudents);

	omp_set_num_threads(6);
	int threadNum = 0;
	#pragma omp parallel private (threadNum)
	{
		int threadNum = omp_get_thread_num();
		if (threadNum == 0) {
			Writer writer = Writer(allWriteStudents[0], threadNum);
			writer.run();
		}
		else if (threadNum == 1) {
			Writer writer = Writer(allWriteStudents[1], threadNum);
			writer.run();
		}
		else if (threadNum == 2) {
			Reader reader = Reader(allReadStudents[0]);
			reader.run();
		}
		else if (threadNum == 3) {
			Reader reader = Reader(allReadStudents[1]);
			reader.run();
		}
		else if (threadNum == 4) {
			Reader reader = Reader(allReadStudents[2]);
			reader.run();
		}
		else if (threadNum == 5) {
			Reader reader = Reader(allReadStudents[3]);
			reader.run();
		}
	}
	writeAllData(resultsFile, allWriteStudents, allReadStudents);
	//cout << "students vector after reading: " << endl;
	//vector<Student> studs = structure.getStudents();
	//for (size_t i = 0; i < studs.size(); i++)
	//{
	//	if (studs[i].name != "") {
	//		cout << studs[i].name << " count: " << studs[i].getCount() << endl;
	//	}
	//}
}

void writeAllData(string file, vector<vector<Student>> &allWriteStudents, vector<vector<Student>> &allReadStudents) {
	ofstream myfile(file);
	if (myfile.is_open())
	{
		myfile << "Pradiniai duomenys atspausdinti lentele: \n" << endl;
		myfile << "Pradiniai rasytoju duomenys atspausdinti vienoje lenteleje:" << endl;
		myfile << "-------------------------------------" << endl;
		myfile << "| " << setw(15) << "Vardas/Pavarde" << " | " << setw(5) << "Gija" << " | " << setw(7) << "Salary" << " |" << endl;
		myfile << "-------------------------------------" << endl;
		for (int i = 0; i < allWriteStudents.size(); i++) {
			for (int j = 0; j < allWriteStudents[i].size(); j++) {
				myfile << "| " << setw(15) << allWriteStudents[i][j].name << " | " << setw(5) << allWriteStudents[i][j].getCount() << " | " << setw(7) << allWriteStudents[i][j].salary << " |" << endl;
			}
		}
		myfile << "-------------------------------------" << endl;
		myfile << "Pradiniai skaitytoju duomenys atspausdinti vienoje lenteleje:" << endl;
		myfile << "---------------------------" << endl;
		myfile << "| " << setw(15) << "Vardas/Pavarde" << " | " << setw(5) << "Count" << " | " << endl;
		myfile << "---------------------------" << endl;
		for (int i = 0; i < allReadStudents.size(); i++) {
			for (int j = 0; j < allReadStudents[i].size(); j++) {
				myfile << "| " << setw(15) << allReadStudents[i][j].name << " | " << setw(5) << allReadStudents[i][j].getCount() << " | " << endl;
			}
		}
		myfile << "-------------------------------------" << endl;
		vector<Student> results = structure.getStudents();
		myfile << "Galutiniai duomenys po skaitymo: " << endl;
		myfile << "-------------------------------------" << endl;
		myfile << "| " << setw(15) << "Vardas/Pavarde" << " | " << setw(5) << "Gija" << " | " << setw(7) << "Salary" << " |" << endl;
		myfile << "-------------------------------------" << endl;
		for (int i = 0; i < results.size(); i++) {
			for (size_t j = 0; j < results[i].getCount(); j++)
			{
				if (results[i].name != "") {
					myfile << "| " << setw(15) << results[i].name << " | " << setw(5) << /*results[i].getCount()*/ "1" << " | " << setw(7) << results[i].salary << " |" << endl;
				}
			}
		}
		myfile << "-------------------------------------" << endl;
		myfile.close();
	}
	else cout << "Unable to open file";
}
//void writeResultsToFile(int arraySize, string names[], int ages[], double heights[], Student students[]) {
//
//	ofstream myfile("./IFF_68_Laurinaitis_Tadas_L1b_rez.txt");
//	if (myfile.is_open())
//	{
//		myfile << "Pradiniai duomenys atspausdinti lentele: \n" << endl;
//		myfile << "-------------------------------------" << endl;
//		myfile << "| " << setw(15) << "Vardas/Pavarde" << " | " << setw(7) << "Amzius" << " | " << setw(5) << "Ugis" << " |" << endl;
//		myfile << "-------------------------------------" << endl;
//		for (int i = 0; i < arraySize; i++) {
//			myfile << "| " << setw(15) << names[i] << " | " << setw(7) << ages[i] << " | " << setw(5) << heights[i] << " |" << endl;
//		}
//
//		myfile << "Galutiniai rezultatai atspausdinti lentele: \n" << endl;
//		myfile << "------------------------------------------" << endl;
//		myfile << setw(5) << "Gija" << "| " << setw(15) << "Vardas/Pavarde" << " | " << setw(7) << "Amzius" << " | " << setw(5) << "Ugis" << " |" << endl;
//		myfile << "------------------------------------------" << endl;
//		for (int i = 0; i < arraySize; i++) {
//			myfile << setw(5) << students[i].threadNumber << "| " << setw(15) << students[i].name << " | " << setw(7) << students[i].age << " | " << setw(5) << students[i].height << " |" << endl;
//		}
//		myfile.close();
//	}
//	else cout << "Unable to open file";
//}

void readAllData(string file, vector<vector<Student>> &allWriteStudents, vector<vector<Student>> &allReadStudents) {
	string line;
	string splitter = ";";
	ifstream myfile(file);
	vector<Student> write;
	vector<Student> read;
	int counter1 = 0;
	int counter2 = 0;
	if (myfile.is_open()){
		while (!myfile.eof()){
			getline(myfile, line);
			if (line.compare("--Write--") == 0) {}
			else if(line.compare("--Read--") == 0){}
			else {
				size_t pos = 0;
				string token;
				string values[3] = {};
				int count = 0;
				while ((pos = line.find(splitter)) != string::npos) {
					token = line.substr(0, pos);
					values[count] = token;
					count++;
					line.erase(0, pos + splitter.length());
				}
				Student temp;
				temp = Student(values[0], stoi(values[1]), stod(values[2]));
				if (temp.count == 1) {
					if (counter1 < 20) {
						write.push_back(temp);
						counter1++;
					}
					else if (counter1 >= 20) {
						allWriteStudents.push_back(write);
						write.clear();
						counter1 = 0;
						write.push_back(temp);
						counter1++;
					}
				}
				else if (temp.count > 1) {
					if (counter2 < 3) {
						read.push_back(temp);
						counter2++;
					}
					else if (counter2 >= 3) {
						allReadStudents.push_back(read);
						read.clear();
						counter2 = 0;
						read.push_back(temp);
						counter2++;
					}
				}
			}
		}
		myfile.close(); //Closes the file
	}
	else cout << "Unable to open file" << endl; //Gives that sentence if the file can't be opened
	allWriteStudents.push_back(write);
	allReadStudents.push_back(read);
}

