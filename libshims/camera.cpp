#include <stdio.h>

// From https://github.com/DysfunctionalROMs/device_leeco_zl1/blob/bb2661850b3dedee20cea802883d9bd974bc30e5/camera/cameraservice_shim.cpp#L33-L37

extern "C" {

extern uint _ZN7android8hardware14ICameraService10descriptorE();

uint _ZN7android14ICameraService10descriptorE(){
	return _ZN7android8hardware14ICameraService10descriptorE();
}
}
