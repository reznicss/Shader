
Shader "Unlit/3"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            
            
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            float4x4 rm;
            float4x4 sm;
            struct v2f{
                float4 pos:POSITION;
                //fixed4 color:COLOR;
            };

            v2f vert(appdata_base v){
                v2f o;
                // float4 m = UnityObjectToClipPos(mul(rm,mul(sm,v.vertex)));
                rm = float4x4(
                cos(-_Time.y), -sin(-_Time.y), 0, 0,
                sin(-_Time.y), cos(-_Time.y), 0, 0,
                0, 0, 1, 0,
                0, 0, 0, 1);
                float4 m = UnityObjectToClipPos(mul(rm,v.vertex));
                // o.pos = mul(rm,m);
                o.pos = m;
                return o;
            }

            fixed4 frag(v2f IN):COLOR{
                return fixed4(1,1,1,1);
            }
            ENDCG
            
        }
    }
}
