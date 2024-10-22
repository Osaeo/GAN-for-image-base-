#ifndef GAN
#define GAN


#include <Eigen/Dense>
#include <iostream>

#include "discri.hpp"
#include "generator.hpp"
#include "resMan.hpp"

class Gan{
public:
    Gan();
private:
    Generator generator;
    Discri discriminator;
    ResMan resman;
};

#endif //!GAN


