﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Leap.Unity;

// EnableDisableKinect is used to turn on or off the Kinect
public class EnableDisableDevices : MonoBehaviour
{
    public KinectManager kinectManager;
    public LeapServiceProvider leapServiceProvider;
    public bool enableKinect = false;
    public bool enableLeap = false;

    void Awake()
    {
        if(!enableKinect)
        {
        	kinectManager.gameObject.SetActive(false);
        }
        else
        {
            kinectManager.gameObject.SetActive(true);
        }
        KinectManager.Instance.refreshAvatarControllers();

        if(!enableLeap)
        {
            leapServiceProvider.gameObject.SetActive(false);
        }
        else
        {
            leapServiceProvider.gameObject.SetActive(true);
        }
    }
}
