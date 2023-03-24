
%Este programa calcula num�ricamente la integral de una funci�n, desde
%luego integrable en un intervalo cerrado [a,b] aplicando el m�todo de
%Simpson 1/3 simple o compuesto seg�n sea n.

%Autores: Jos� Julio Conde Mones, Claudio Lazcano Morales, Carlos Arturo Hernadez Gracidas, Felix Augusto Aquino Camacho, Jos� Jacobo Oliveros Oliveros.


clear all
clc

%%%%%%%%%%%%%%%%%%%%%%       RECAUDACI�N DE DATOS       %%%%%%%%%%%%%%%%%%%%%%

fprintf('\n  "INTEGRACI�N NUM�RICA POR EL M�TODO DE SIMPSON 1/3"\n\n');

Exp_f=input('  Ingrese la funci�n:   f(x) = ','s');
f=inline(Exp_f);        %convierte el texto en funci�n.

a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');
    if a>b
        while a>b
        fprintf('\n     NOTA: Recuerde que a tiene que ser menor que b.\n\n');
        a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
        b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');
        end
    end
    
fprintf(' Escriba el n�mero par de subintervalos para [%d,%d]:   n = ',a,b)
n=input(' ');
m=mod(n,2);
    if m==1
        while m==1
            fprintf('\n     NOTA: Recuerde que n debe ser par.\n\n')
            fprintf(' Escriba nuevamente el n�mero n de subintervalos para [%d,%d]:   n = ',a,b)
            n=input(' ');
            m=mod(n,2);
        end
    end
    
    
%%%%%%%%%%%%%%%%%%%%%%      INICIA M�TODO DE INTEGRACI�N: Simpson 1/3.      %%%%%%%%%%%%%%%%%%%%%%
    
    if m==0
        h=(b-a)/n;      %Longitud del intervalo (Delta x_i)
        y=a:h:b;        %Las x en [a,b]
        
        if n==2         %Cuando n=2 se aplica el M�todo de Simpson 1/3 simple, cuya aproximaci�n es la siguiente:
            int_aprox_f = (h/3)*( feval(f,y(1))+4*feval(f,y(2))+feval(f,y(3)) );
        else            %Cuando n~=2 se aplica el M�todo de Simpson 1/3 compuesto, cuya aproximaci�n es la siguiente:
            alpha=0;    %temporal
            betha=0;    %temporal
        
                for i=1:(n/2)
                    alpha=alpha+feval(f,y(2*i));
                end
                for i=1:((n-2)/2)
                    betha=betha+feval(f,y(2*i+1));
                end

            int_aprox_f = (h/3)*( feval(f,y(1))+4*alpha+2*betha+feval(f,y(n+1)) );
        end
        
            fprintf('\n     Considerando %d subintervalos, la longitud de cada uno es h = %4.4e \n',n,h);
            fprintf('\n     La integral aproximada de la funci�n f(x) en [%d,%d] es: %4.4e \n\n',a,b,int_aprox_f);
            
    end
    
    
%%%%%%%%%%%%%%%%%%%%%%      C�LCULO DE ERRORES      %%%%%%%%%%%%%%%%%%%%%%
    
E=input(' Si quiere calcular el error, ingrese "1", de lo contrario, ingrese cualquier otro n�mero: ');

if E == 1
    fprintf('\n Si existe la integral exacta de f(x) en [%d,%d] puedes calcular los errores cometidos en este M�todo Num�rico.\n',a,b);

    integral_exacta = input(' Ingrese el valor de la Integral Exacta:     Integral Exacta = ');

    Error_Absoluto = abs( integral_exacta - int_aprox_f);
    Error_Relativo = Error_Absoluto / abs(integral_exacta);
    Error_Porcentual = Error_Relativo*100;

    fprintf('\n El error cometido por el M�todo de Simpson 1/3 es: \n');
    fprintf('       ERROR ABSOLUTO  = %4.4e \n',Error_Absoluto);
    fprintf('       ERROR RELATIVO  = %4.4e \n',Error_Relativo);
    fprintf('      ERROR PORCENTUAL = %4.4e por ciento \n',Error_Porcentual);
end



