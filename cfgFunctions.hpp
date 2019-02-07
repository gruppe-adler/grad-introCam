#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class GRAD_introCam {

    class client {
            file = MODULES_DIRECTORY\grad-introCam\functions\client;

            class camAttached;
            class camCommands;
            class camFree;
            class camRotate;
            class play;
    };

    class server {
            file = MODULES_DIRECTORY\grad-introCam\functions\server;

            class addShot;
            class init;
            class shotDefinitions { postInit = 1; };
    };

};
