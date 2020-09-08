
Shader "Unlit/4"
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
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                // o.color = o.pos.x > 0.5 ? fixed4(1,0,0,1) : fixed4(0,0,1,1);
                // o.color = (v.vertex.x == 0.5 && v.vertex.y ==0.5 && v.vertex.z == -0.5) ? fixed4(1,0,0,1) : fixed4(0,0,1,1);
                o.color = (v.vertex.x == 0.5 && v.vertex.y ==0.5 && v.vertex.z == -0.5) ? fixed4(_SinTime.w/2 + 0.5, _CosTime.w /2 + 0.5, _SinTime.w/2 + 0.5,1) : fixed4(0,0,1,1);
                
                return o;
            }

            fixed4 frag(v2f IN):COLOR{
                return IN.color;
            }
            ENDCG
            
        }
    }
}
