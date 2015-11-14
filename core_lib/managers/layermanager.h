#ifndef LAYER_MANAGER_H
#define LAYER_MANAGER_H

#include "basemanager.h"

class Layer;
class LayerSound;



class LayerManager : public BaseManager
{
    Q_OBJECT

public:
    LayerManager( QObject* pParant );
    ~LayerManager();
    bool init() override;

    // Layer Management
    Layer* currentLayer();
    Layer* currentLayer( int offset );
    int    getLastCameraLayer();
    int    currentLayerIndex();
    void   setCurrentLayer( int nIndex );
    void   setCurrentLayer( Layer* layer );
    int    count();

    bool   deleteCurrentLayer();

    void gotoNextLayer();
    void gotoPreviouslayer();

    LayerSound* createSoundLayer( QString strLayerName );
    
    // KeyFrame Management
    int  LastFrameAtFrame( int frameIndex );
    int  firstKeyFrameIndex();
    int  lastKeyFrameIndex();

    void gotoLastKeyFrame();
    void gotoFirstKeyFrame();

    int  projectLength();

Q_SIGNALS:
    void currentLayerChanged( int n );
    void layerCountChanged( int count );

private:
    int mCurrentLayerIndex = 0; // the current layer to be edited/displayed
    int lastCameraLayer = 0;
};

#endif
