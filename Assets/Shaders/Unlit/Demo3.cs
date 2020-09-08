using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class Demo3 : MonoBehaviour
{
    Matrix4x4 _rm = Matrix4x4.identity;
    Matrix4x4 _sm = Matrix4x4.identity;
    Material material;

    void Start()
    {
        material = GetComponent<Renderer>().material;
    }

    void Update()
    {
        //绕X
        // rm.m11 = Mathf.Cos(Time.realtimeSinceStartup);
        // rm.m12 = -Mathf.Sin(Time.realtimeSinceStartup);
        // rm.m21 = Mathf.Sin(Time.realtimeSinceStartup);
        // rm.m22 = Mathf.Cos(Time.realtimeSinceStartup);

        //绕Y
        // rm.m00 = Mathf.Cos(Time.realtimeSinceStartup);
        // rm.m02 = Mathf.Sin(Time.realtimeSinceStartup);
        // rm.m20 = -Mathf.Sin(Time.realtimeSinceStartup);
        // rm.m22 = Mathf.Cos(Time.realtimeSinceStartup);

        //绕Z
        _rm.m00 = Mathf.Cos(Time.realtimeSinceStartup);
        _rm.m01 = -Mathf.Sin(Time.realtimeSinceStartup);
        _rm.m10 = Mathf.Sin(Time.realtimeSinceStartup);
        _rm.m11 = Mathf.Cos(Time.realtimeSinceStartup);

        _sm.m00 = Mathf.Sin(Time.realtimeSinceStartup);
        _sm.m11 = Mathf.Cos(Time.realtimeSinceStartup);
        _sm.m22 = Mathf.Sin(Time.realtimeSinceStartup);

        material.SetMatrix("rm", _rm);
        material.SetMatrix("sm",_sm);

    }
}
