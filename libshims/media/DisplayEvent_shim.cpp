#include <string.h>
#include <stdlib.h>

#include <gui/DisplayEventReceiver.h>

extern "C" {
    /* Android N exports */
    void _ZN7android20DisplayEventReceiverC1ENS_16ISurfaceComposer11VsyncSourceE();

    /* 
     * FUNCTION NAME: Display::EventReceiver.
     * USE: DisplayEventReceiver creates and registers an event connection with SurfaceFlinger.
     * NOTES: It looks like this function was renamed in N. Stub out to the correct call.
     */
    void _ZN7android20DisplayEventReceiverC1Ev() {
        _ZN7android20DisplayEventReceiverC1ENS_16ISurfaceComposer11VsyncSourceE;
    }
}
