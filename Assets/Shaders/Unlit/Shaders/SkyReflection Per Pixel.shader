//使用法线贴图的环境反射
Shader "Unlit/SkyReflection Per Pixel"{
    SubShader{
        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct v2f{
                float3 worldPos : TEXCOORD0;
                half3 worldNormal : TEXCOORD1;
                float4 pos : SV_POSITION;
            };

            v2f vert(float4 vertex : POSITION,float3 normal : NORMAL){
                v2f o;
                o.pos = UnityObjectToClipPos(vertex);
                o.worldPos = mul(unity_ObjectToWorld,vertex).xyz;
                o.worldNormal = UnityObjectToWorldNormal(normal);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target{
                half3 worldViewDir = normalize(UnityWorldSpaceViewDir(i.worldPos));
                half3 worldRefl = reflect(-worldViewDir, i.worldNormal); 

                half4 skyData = UNITY_SAMPLE_TEXCUBE(unity_SpecCube0, worldRefl);
                half3 skyColor = DecodeHDR(skyData, unity_SpecCube0_HDR);
                fixed4 c = 0;
                c.rgb = skyColor;
                return c;
            }
            ENDCG
        }
    }
}