class GRAD_introCam {
    class client {
            file = grad-introCam\functions\client;

            class camAttached;
            class camCommands;
            class camFree;
            class camRotate;
            class marchStart;
            class play;
            class textEffects;
    };

    class server {
            file = grad-introCam\functions\server;

            class addShot;
            class init;
            class shotDefinitions { postInit = 1; };
    };

};
