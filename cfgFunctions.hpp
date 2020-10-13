#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_introCam {
    class client {
        file = MODULES_DIRECTORY\grad-introCam\functions\client;
        class blend;
        class camAttached;
        class camMove;
        class camRotate;
        class createCam;
        class getPos;
        class handleNextShot;
        class play;
    };

    class server {
        file = MODULES_DIRECTORY\grad-introCam\functions\server;
        class addShot;
        class init { postInit = 1; };
    };
};
