class GRAD_introCam {
    class client {
            file = grad-introCam\functions\client;

            class camAttached;
            class camFree;
            class camRotate;
            class createCam;
            class handleNextShot;
            class play;
    };

    class server {
            file = grad-introCam\functions\server;

            class addShot;
            class init { postInit = 1; };
            class shotDefinitions;
    };

};
