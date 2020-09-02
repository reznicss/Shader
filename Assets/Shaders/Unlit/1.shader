Shader "Unlit/1"
{
    SubShader{
        pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            void vert(in float4 objPos:POSITION, out float4 pos:POSITION,out float4 col:COLOR){
                pos = UnityObjectToClipPos(objPos);
                // col = float4(1,0,0,1);
                // col = float4(0,1,0,1);
            }

            void frag(inout float4 col:COLOR){
                // col = float4(1,0,0,1);
                // col = float4(0,1,0,1);
                // col = pos;

                // fixed r = 1;
                // fixed g = 0;
                // fixed b = 0;
                // fixed a = 1;
                // col = fixed4(r,g,b,a);

                // bool b1 = true;
                // col = b1 ? col: float4(0,1,0,1);

                float2 fl2 = float2(1,0);
                float3 fl3 = float3(1,0,0);
                float4 fl4 = float4(1,0,0,1);

                // float4 f1 = float4(fl2.xy,0,1);
                // float4 f1 = float4(fl3.rgb,1);
                // float4 f1 = float4(fl4);
                float4 f1 = float4(fl3.rgbr);

                col = f1;
            }
            ENDCG
        }
    }
}
