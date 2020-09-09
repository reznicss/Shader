
Shader "Unlit/6"
{
    Properties{
        _R ("R", Range (0, 10)) = 1
    }

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float _R;
            struct v2f{
                float4 pos:POSITION;
                fixed4 color:COLOR;
            };

            v2f vert(appdata_base v){
                // float4 wpos = mul(unity_ObjectToWorld, v.vertex);
                // float2 xy = wpos.xz;

                float2 xy = v.vertex.xz;
                float dis = _R - length(xy);
                dis = dis < 0 ? 0 : dis;
                float length = 1;
                float4 upPos = float4(v.vertex.x, length * dis, v.vertex.z, v.vertex.w);
                v2f o;
                o.pos = UnityObjectToClipPos(upPos);
                o.color = fixed4(upPos.y, upPos.y, upPos.y, 1);
                return o;
            }

            fixed4 frag(v2f IN):COLOR{
                return IN.color;
            }
            ENDCG
            
        }
    }
}
