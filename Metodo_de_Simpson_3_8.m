
%Este programa calcula numericamente la integral de una función, desde
%luego integrable en un intervalo cerrado [a,b] aplicando el método de
%Simpson 3/8 simple o compuesto según sea n.

%Autores: José Julio Conde Mones, Claudio Lazcano Morales, Carlos Arturo Hernadez Gracidas, Felix Augusto Aquino Camacho, José Jacobo Oliveros Oliveros.



clear all
clc


%%%%%%%%%%%%%%%%%%%%%%       RECAUDACIÓN DE DATOS       %%%%%%%%%%%%%%%%%%%%%%

fprintf('\n  "INTEGRACIÓN NUMÉRICA POR EL MÉTODO DE SIMPSON 3/8""\n\n');

Exp_f=input('  Ingrese la función:   f(x) = ','s');
f=inline(Exp_f);            %convierte el texto en función.

a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');
    if a>b
        while a>b
        fprintf('\n     NOTA: Recuerde que a tiene que ser menor que b.\n\n');
        a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
        b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');
        end
    end
    
fprintf(' Escriba el número múltiplo de 3 de subintervalos para [%d,%d]:   n = ',a,b)
n=input(' ');
m=mod(n,3);
    if m~=0
        while m~=0
            fprintf('\n     NOTA: Recuerde que "n" tiene que ser múltiplo de 3. \n\n');
            n=input(' Escriba nuevamente el número n de subintervalos para [a,b]:    ');
            m=mod(n,3);
        end
    end
    
    
%%%%%%%%%%%%%%%%%%%%%%      INICIA MÓTODO DE INTEGRACIÓN: Simpson 3/8.      %%%%%%%%%%%%%%%%%%%%%%
    
    if m==0
       h=(b-a)/n;       %Longitud del intervalo (Delta x_i)
       y=a:h:b;         %Las x en [a,b]
       
       if n==3          %Cuando n=3 se aplica el Método de Simpson 3/8 simple, cuya aproximación es la siguiente:
           int_aprox_f = ((3*h)/8)*( feval(f,y(1))+3*feval(f,y(2))+3*feval(f,y(3))+feval(f,y(4)) );   
       else             %Cuando n~=3 se aplica el Método de Simpson 3/8 compuesto, cuya aproximación es la siguiente:
           alpha=0;     %temporal
           betha=0;     %temporal
           gamma=0;     %temporal
       
           for i=1:n/3
               alpha=alpha+feval(f,y((3*i)-1));
           end
           for i=1:n/3
               betha=betha+feval(f,y(3*i));
           end
           for i=1:(n-3)/3
               gamma=gamma+feval(f,y((3*i)+1));
           end
           
           int_aprox_f = ((3*h)/8)*( feval(f,y(1))+3*alpha+3*betha+2*gamma+feval(f,y(n+1)) );
       end
       
           fprintf('\n     Considerando %d subintervalos, la longitud de cada uno es de %4.4e \n',n,h);
           fprintf('\n     La integral aproximada de la función f en [a,b] es: %4.4e \n\n',int_aprox_f);
           
    end
    
    
%%%%%%%%%%%%%%%%%%%%%%      CÁLCULO DE ERRORES      %%%%%%%%%%%%%%%%%%%%%%

E=input(' Si quiere calcular el error, ingrese "1", de lo contrario, ingrese cualquier otro número: ');
if E == 1
    fprintf(' Si existe la integral exacta de f(x) en [%d,%d] puedes calcular los errores cometidos en este Método Numérico.\n\n',a,b);

    integral_exacta=input('Ingrese el valor de la Integral Exacta:     Integral Exacta = ');

    Error_Absoluto = abs( integral_exacta - int_aprox_f);
    Error_Relativo = Error_Absoluto / abs(integral_exacta);
    Error_Porcentual = Error_Relativo*100;
    
    fprintf('\n El error cometido por el Método de Simpson 3/8 es: \n');
    fprintf('       ERROR ABSOLUTO  = %4.4e \n',Error_Absoluto);
    fprintf('       ERROR RELATIVO  = %4.4e \n',Error_Relativo);
    fprintf('      ERROR PORCENTUAL = %4.4e por ciento \n',Error_Porcentual);
end



