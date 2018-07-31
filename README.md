# Guyton72
Directory fortranSrc contains Guyton72 implementation in fortran according to
*On a basic model of circulatory, fluid, and electrolyte regulation in the human system based upon the model of Guyton; White, R. J.*
https://ntrs.nasa.gov/search.jsp?R=19790017554

A fortran compiler is needed to build the model.

**In Linux**
Use e.g. GFortran compiler (free):
To build the model, in the fortranSrc call the command
> gfortran Guyton72.f -o Guyton72 -O2

To run the program, call
>./Guyton72

The results are saved in Guyton72Results.txt file.

**In Windows**
???