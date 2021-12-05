  function keli
    kodas = [2 3 4 1 3 2 6 7]
    A = virsunes(kodas)
    B = briaunos(kodas, A)
    C = konversija(B)
    Vkor = plotGraphVU1(A,C,0,0,[],0,10,1,'b')
  end
  
  function A = virsunes(keliKodas)
    l = length(keliKodas)
    vl = l+2
    A = int16([])
    A = reshape(A, 0,vl)
    for v = 1:1:vl
      A(v) = v
    end
  end
  
  function B = briaunos(keliKodas, virsunes)
    B = int16([])
    B = reshape(B, 0, length(keliKodas)+1)
    B(2,1) = 1;
    z = 1;
    for x = 1:1:length(keliKodas)
      
      B(2,x) = keliKodas(x)
      for y = 1:1:length(virsunes)
        
        if(virsunes(y) > 0)
          l = ismember(virsunes(y), keliKodas)
          if(l == 0)
            B(1,x) = virsunes(y)
            virsunes(y) = 0
            keliKodas(x) = 0
            break
          else
            continue
          end
        else
            continue
        end 
      end
    end
    for q = 1:1:length(virsunes)
      if(virsunes(q) > 0)
        B(z,length(B)) = virsunes(q)
        z = z+1;
      else
      end
      end
  end
  
  function C = konversija(masyvas)
  z = length(masyvas(1,:))
  C = {}
  for x = 1:z
      C{x} = masyvas(:,x)
      
      
  end
  end