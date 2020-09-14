Shader "Unlit/1"
{
    SubShader{
        Pass{
            CGPROGRAM
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
#pragma exclude_renderers d3d11 gles
// Upgrade NOTE: excluded shader from DX11, OpenGL ES 2.0 because it uses unsized arrays
            #pragma vertex vert
            #pragma fragment frag
            #include "ss/1.cginc"

            void vert(in float4 objPos:POSITION, out float4 pos:POSITION){
                pos = UnityObjectToClipPos(objPos);

                // col = float4(1,0,0,1);
                // col = float4(0,1,0,1);
       
            }

            void frag(inout float4 col:COLOR,in float4 pos:POSITION){
                // col = float4(1,0,0,1);
                // col = float4(0,1,0,1);

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

                //swizzel
                // float4 f1 = float4(fl2.xy,0,1);
                // float4 f1 = float4(fl3.rgb,1);
                // float4 f1 = float4(fl4);
                //col = f1;
                float4 f1 = float4(fl3.rgbr);

                //用if...else取代switch
                // if(pos.x < 0){
                //     col = float4(1,0,0,1);
                // }else{
                //     col = float4(0,1,0,1);
                // }
                col = float4(1,0,0,1);
				float[] arr = { 0.5, 0.5 };
                col.x = Func2(arr) ;
            }
            ENDCG
        }
    }
}
