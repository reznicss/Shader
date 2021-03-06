﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'


Shader "Unlit/7"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f{
                float4 pos:POSITION;
                fixed4 color:COLOR;
            };

            v2f vert(appdata_base v){
                // float angle = length(v.vertex) * _SinTime.w;
                float angle = length(v.vertex) + _Time.y;
                // float4x4 m = {
                //     cos(angle),0,sin(angle),0,
                //     0,1,0,0,
                //     -sin(angle),0,cos(angle),0,
                //     0,0,0,1
                // };

                // float x = v.vertex.x * cos(angle) + v.vertex.z * sin(angle);
                // float z = v.vertex.z * cos(angle) - v.vertex.x * sin(angle);
                // v.vertex.x = x;
                // v.vertex.z = z;

                float4x4 m = {
                    sin(angle)/8 + 0.5,0,0,0,
                    0,1,0,0,
                    0,0,1,0,
                    0,0,0,1
                };

                v2f o;
                o.pos = UnityObjectToClipPos(mul(m,v.vertex));
                // o.pos = UnityObjectToClipPos(v.vertex);
                o.color = fixed4(1,0,0,1);
                return o;
            }

            fixed4 frag(v2f IN):COLOR{
                return IN.color;
            }
            ENDCG
            
        }
    }
}
