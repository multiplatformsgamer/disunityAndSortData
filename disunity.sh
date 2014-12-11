#!/bin/bash
move()
{
for x in $(ls)
    do
    if [ "$2" == Texture2D ];then
        cp -f "$x" "$Texture2DDir/"
    elif [ "$2" == AudioClip ];then
        cp -f "$x" "$AudioClipDir/"
    elif [ "$2" == Mesh ];then
        cp -f "$x" "$MeshDir/"
    elif [ "$2" == TextAsset ];then
        cp -f "$x" "$TextAssetDir/"
    elif [ "$2" == Shader ];then
        cp -f "$x" "$ShadeDir/"
    fi
done
}
traversalDir()
{
for x in $(ls)
    do
        if [ -d "$x" ];then
            cd "$x"
            if [ "$x" == Texture2D ];then
                move "$x" Texture2D
            elif [ "$x" == AudioClip ];then
                move "$x" AudioClip
            elif [ "$x" == Mesh ];then
                move "$x" Mesh
            elif [ "$x" == TextAsset ];then
                move "$x" TextAsset
            elif [ "$x" == Shader ];then
                move "$x" Shader
            fi
                traversalDir;
                cd ..
            fi
done
}

java -jar "/Users/sgame/workSapce/customShell/disunity.jar" extract "$PWD/$1"
echo "disUnity ----------------------------------------finish"

mkdir outData
cd outData
Texture2DDir="$PWD/Texture2D"
AudioClipDir="$PWD/AudioClip"
MeshDir="$PWD/Mesh"
TextAssetDir="$PWD/TextAsset"
ShaderDir="$PWD/Shader"
mkdir Texture2D
mkdir AudioClip
mkdir Mesh
mkdir TextAsset
mkdir Shader
cd ../$1
traversalDir

echo "sort ----------------------------------------finish"
