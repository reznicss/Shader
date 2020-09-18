Shader "Unlit/2"
{
   Properties{
       _MainColor("Main Color", color) = (1,1,1,1)
   }

   SubShader{
       Pass{
           CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float4 _MainColor;
			uniform float4 _SecondColor;

            struct v2f{
                float4 pos:POSITION;
                float2 objPos:TEXCOORD0;
                float4 col:COLOR;
            };

            v2f vert(appdata_base v){
                v2f o;
                o.pos = float4(v.vertex);
                o.objPos = float2(1,0);
                o.col = _MainColor;
                return o;
            }

            fixed4 frag(v2f IN):COLOR{
                return IN.col * 0.5 + _SecondColor * 0.5;
            }

           ENDCG
       }
   }
}
