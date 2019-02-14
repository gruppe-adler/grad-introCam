class GRAD_introCam {
    class client {
            file = grad-introCam\functions\client;

            class camAttached;
            class camFree;
            class camRotate;
            class createCam;
            class play;
    };

    class server {
            file = grad-introCam\functions\server;

            class addShot;
            class init;
            class shotDefinitions { postInit = 1; };
    };

};
