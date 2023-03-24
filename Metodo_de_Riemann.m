
%Este programa calcula numéricamente la integral de una función, desde
%luego integrable en un intervalo cerrado [a,b] aplicando el método de
%Sumas de Riemann.

%Autores: José Julio Conde Mones, Claudio Lazcano Morales, Carlos Arturo Hernadez Gracidas, Felix Augusto Aquino Camacho, José Jacobo Oliveros Oliveros.


clear all
clc

%%%%%%%%%%%%%%%%%%%%%%       RECAUDACIÓN DE DATOS       %%%%%%%%%%%%%%%%%%%%%%

fprintf('\n  "INTEGRACIÓN NUMÉRICA POR EL MÉTODO DE SUMAS DE RIEMANN"\n\n');

Exp_f=input('  Ingrese la función:   f(x) = ','s');   % Aquí el usuario ingresa la función.
f=inline(Exp_f);                                    %Convierte el texto anterior en función.

a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');

    if a>b
        while a>b
        fprintf('\n     NOTA: Recuerde que a tiene que ser menor que b.\n\n');
        a=input(' Ingrese el valor del extremo izquierdo del intervalo:   a = ');
        b=input(' Ingrese el valor del extremo derecho del intervalo:   b = ');
        end
    end
    
fprintf(' Escriba el numero de subintervalos para [%d,%d]:   n = ',a,b)
n=input(' ');


%%%%%%%%%%%%%%%%%%%%%%      INICIA MÉTODO DE INTEGRACIÓN: Regla del Punto Medio.      %%%%%%%%%%%%%%%%%%%%%%

h=(b-a)/n;      %h es la longitud de cada subintervalo.
x=a:h:b;        %x se encuentra entre a y b cada h de longitud.
suma=0;

for i=1:n
    punto_medio = ( x(i)+x(i+1) )/2;    % En este caso la Selección de la Partición P es A={alpha_i en [x_i,x_(i+1)] : alpha_i=(x(i)+x(i+1))/2, con i=1,...,n}, es decir, alpha_i es el punto medio.
    altura = feval(f,punto_medio);      % La altura de cada rectángulo es f evaluada en cada elemento de la selección (Punto Medio).
    suma = suma+(h*altura);             % h es la base del rectángulo pues es una partición regular.
end

int_aprox_f = suma;

fprintf('\n     Considerando %d subintervalos, el tamaño de la malla regular es h = %4.4e \n',n,h);
fprintf('\n     La integral aproximada de la función f en [%d,%d] es: %4.4e \n\n',a,b,int_aprox_f);


%%%%%%%%%%%%%%%%%%%%%%      CÁLCULO DE ERRORES      %%%%%%%%%%%%%%%%%%%%%%

E=input(' Si quiere calcular el error, ingrese "1", de lo contrario, ingrese cualquier otro número: ');
if E == 1
    fprintf('\n Si existe la integral exacta de f(x) en [%d,%d] puedes calcular los errores cometidos en este Método Numérico.\n',a,b);

    integral_exacta=input('Ingrese el valor de la Integral Exacta:     Integral Exacta = ');

    Error_Absoluto = abs( integral_exacta - int_aprox_f);
    Error_Relativo = Error_Absoluto / abs(integral_exacta);
    Error_Porcentual = Error_Relativo*100;
    
    fprintf('\n El error cometido por el Método de Riemann es: \n');
    fprintf('       ERROR ABSOLUTO  = %4.4e \n',Error_Absoluto);
    fprintf('       ERROR RELATIVO  = %4.4e \n',Error_Relativo);
    fprintf('      ERROR PORCENTUAL = %4.4e por ciento \n',Error_Porcentual);
end