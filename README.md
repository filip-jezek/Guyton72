# Guyton72
Directory fortranSrc contains the Guyton72 implementation in fortran according to
*On a basic model of circulatory, fluid, and electrolyte regulation in the human system based upon the model of Guyton; White, R. J.*
https://ntrs.nasa.gov/search.jsp?R=19790017554

A fortran compiler is needed to build the model.

**Linux**
Use e.g. GFortran compiler (free):
To build the model, call the following command in the fortranSrc directory
> gfortran Guyton72.f -o Guyton72 -O2

To run the program, call
>./Guyton72

Results are saved in the file Guyton72Results.txt.

**Windows**
We recomend using FTN95 compiler and Plato IDE by SilverFrost (www.silverfrost.com).