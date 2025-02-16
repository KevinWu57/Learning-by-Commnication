﻿using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using UnityEditor;
using Object = UnityEngine.Object;

// This is the base class for objects used in object-navigation task
public class NavObj
{
    // obj category
    public enum ObjCategory
    {
        OnFloor, OnFurnitureTop, OnWall
    };

    // obj type
    public enum ObjType
    {
        // chair, sofa, lamp, table, ball, box, cabinet, rack, bed, fridge,
        // cup, book, laptop, plant, monitor, cellphone, pen, wallet, bottle, comb,
        // clock, painting, map, hat, photo, artifact, socket, window, balloon, board

        chair, sofa, lamp, table, cup, book, laptop, plant, clock, painting
    };

    // NavObj attributes
    public string objName; // name of the obj
    public ObjCategory objCat; // obj category
    public ObjType objType; // obj type
    public Object objInstance; // Gameobject instance
    public int objInstanceNum; // Object instance number. Each gameObject created in the scenen will have a unique tag

    // Initialize a NavObj
    public NavObj(Object obj, int catNum)
    {
        objName = obj.name;
        objType = (ObjType)Enum.GetNames(typeof(ObjType)).ToList().IndexOf(objName.Split('_')[0]);
        objCat = (ObjCategory)catNum; // 0: onFloor, 1: onFurnitureTop, 2: onWall
        objInstance = obj;
        objInstanceNum = 0;
    }
}
