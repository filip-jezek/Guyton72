# Guyton72
Fortran version according to 
On a basic model of circulatory, fluid, and electrolyte regulation in the human system based upon the model of Guyton; White, R. J.
https://ntrs.nasa.gov/search.jsp?R=19790017554

A fortran compiler is needed to build the model.
Gfortran is one, that is freely available.
To build the model, in the fortranSrc call the command
> gfortran Guyton72.f -o Guyton72 -O2

to run the program, call
>./Guyton72

The results are saved in file Guyton72Results.txt.
