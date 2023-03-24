
% SEGUNDA VERSI�N DE LA REGLA DEL TRAPECIO PARA CUALQUIER FUNCI�N
% Fecha de actualizaci�n: 21 de enero de 2019.
% Este programa calcula num�ricamente la integral de una funci� continua 
% en un intervalo cerrado [a,b] aplicando la Regla del Trapecio Compuesta.

%Autores: Jos� Julio Conde Mones, Claudio Lazcano Morales, Carlos Arturo Hernadez Gracidas, Felix Augusto Aquino Camacho, Jos� Jacobo Oliveros Oliveros.


clear all
clc

%%%%%%%%%%%%%%%%%%%%%%       RECAUDACI�N DE DATOS       %%%%%%%%%%%%%%%%%%%%%%

fprintf('\n  "REGLA DEL TRAPECIO PARA INTEGRAR NUM�RICANTE UNA FUNCI�N EN [a,b]"\n\n');

Exp_f=input('  Ingrese la funci�n a integrar f(x): ','s');

f=inline(Exp_f); % esta instrucci�n es para convertir el texto en funci�n y para poder evaluar la funci�n en un punto x.

a=input(' Escriba el valor del extremo izquierdo del intervalo "a":    ');
b=input(' Escriba el valor del extremo derecho del intervalo "b":    ');
    if a>b
        while a>b
        fprintf('\n Advertencia: El valor de "a" tiene que ser menor que "b".\n\n');
        a=input(' Escriba otra vez el valor del extremo izquierdo del intervalo "a":    ');
        b=input(' Escriba otra vez el valor del extremo derecho del intervalo "b":    ');
        end
    end
    
n=input(' Escriba el n�mero "n" de subintervalos para [a,b]:  ');

    if n < 1
        while n < 1
            fprintf('\n  Advertencia: El valor de "n" debe ser mayor que cero.\n\n');
            n=input(' Escriba nuevamente el n�mero "n" de subintervalos para [a,b]:    ');
            m=mod(n,2);
        end
    end
    
if n > 0
    
        h=(b-a)/n; % h es el tama�o de la malla regular P (h es la longitud del subintervalo  [x_{i-1},x_{i}], para i=0, ..., n).
        x_i=a:h:b; % nodos x_i de la partici�n regular P = { x_i = a + (i*(b-a))/n = a + i*h, para i=0,1,2,...,n } del intervalo [a,b], 
                   % donde h es el tama�o de la malla regular P.
        
        fprintf('\n         Considerando %d subintervalos, la longitud de la malla regular es h= %4.4e \n',n,h);


%%%%%%%%%%%%%% INICIA M�TODO DE INTEGRACI�N: Regla del Trapecio. %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Suma=0;

for i=1:(n+1) % OBSERVACI�N: Los indices en Matlab siempre empiezan en 1.
    
if i == 1

     Suma = Suma + feval(f,x_i(1))*h/2; % donde h=(b-a)/n.
     
else

if (i>1)  &&  (i<(n+1))          

    Suma = Suma + feval(f,x_i(i))*h; % donde h=(b-a)/n.
    
else

if i == (n+1)

    Suma = Suma + feval(f,x_i(n+1))*h/2; % donde h=(b-a)/n.
    
end
end
end
end

            
int_aprox_f = Suma; % int_aprox_f es la integral aproximada de la funcion f en [a,b]. 

end

fprintf('\n         La integral aproximada de la funci�n f en [%d,%d] es: %4.4e \n\n',a,b,int_aprox_f)


%%%%%%%%%%%%%%%%%%%%%%      C�LCULO DE ERRORES      %%%%%%%%%%%%%%%%%%%%%%

E=input(' Si quiere calcular el error, ingrese "1", de lo contrario, ingrese cualquier otro n�mero: ');
if E == 1
    fprintf('\n Si existe la integral exacta de f(x) en [%d,%d] puedes calcular los errores cometidos en este M�todo Num�rico.\n',a,b);

    integral_exacta=input('Ingrese el valor de la Integral Exacta:     Integral Exacta = ');

    Error_Absoluto = abs( integral_exacta - int_aprox_f);
    Error_Relativo = Error_Absoluto / abs(integral_exacta);
    Error_Porcentual = Error_Relativo*100;
    
    fprintf('\n El error cometido por el M�todo del Trapecio es: \n');
    fprintf('       ERROR ABSOLUTO  = %4.4e \n',Error_Absoluto);
    fprintf('       ERROR RELATIVO  = %4.4e \n',Error_Relativo);
    fprintf('      ERROR PORCENTUAL = %4.4e por ciento \n',Error_Porcentual);
end


