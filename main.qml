import QtQuick 2.1 as QQ2
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0
import QtQuick 2.0
import QtQuick.Controls 2.1
//import QtQuick.Scene3D 2.0
import QtQuick.Scene3D 2.1

Item {
    property int  xAxial: 0
    property int  yAxial: 0
    property int  zAxial: 0


    Scene3D{
        anchors.fill: parent

        Entity {
            id: sceneRoot

            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 30
                aspectRatio: 541 / 551  // _window.width / _window.height
                nearPlane: 0.1
                farPlane: 1500.0
                position: Qt.vector3d(0.0, 30.0, 60.0)
                viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
                upVector: Qt.vector3d(0.0, 1.0, 0.0)
            }

            FirstPersonCameraController { camera: camera }

            ShadowMapLight {
                id: light
            }

            components: [
                ShadowMapFrameGraph {
                    id: framegraph
                    viewCamera: camera
        //            lightCamera: light.lightCamera
                }/*,
                // Event Source will be set by the Qt3DQuickWindow
                InputSettings { }*/
            ]

            AdsEffect {
                id: shadowMapEffect

                shadowTexture: framegraph.shadowTexture
                light: light
            }

            // ToothBrush entity
            ToothBrush {
                material: AdsMaterial {
                    effect: shadowMapEffect
                    specularColor: Qt.rgba(0.5, 0.5, 0.5, 1.0) // 镜面颜色
                }

                property Material material // 描述它的表面外观

                Mesh {  // 几何来描述它的形状
                    id: toothbrushMesh
                    source: "qrc:/assets/obj/toothbrush.obj"
                }

                Transform {
                    id: toothbrushMeshTransform

                    rotation: fromEulerAngles(xAxial, yAxial, zAxial)//Qt.vector3d(xAxial, yAxial, zAxial))
                }

                components: [
                    toothbrushMesh,
                    toothbrushMeshTransform,
                    material
                ]
            }

            // GroundPlane entity
            GroundPlane {
                material: AdsMaterial {
                    effect: shadowMapEffect
                    diffuseColor: Qt.rgba(0.2, 0.5, 0.3, 1.0) // 漫反射颜色
                    specularColor: Qt.rgba(0, 0, 0, 1.0) // 镜面颜色
                }
            }
        }
    }

    Text{
            id:keyView;
            font.bold:true;
            font.pixelSize:22;
            text:"xAxial:"+xAxial+"\n"+"yAxial:"+yAxial+"\n"+"zAxial:"+zAxial;

            anchors.rightMargin: parent;
            color:"#FF5500";
        }

    // recv data
    function updateAngle(xAngle, yAngle, zAngle) {

        console.log("x:"+xAngle+",y:"+yAngle+",z:"+zAngle)

        xAxial = xAngle;
        yAxial = yAngle;
        zAxial = zAngle;
    }
}
