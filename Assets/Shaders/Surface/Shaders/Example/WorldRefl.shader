Shader "Example/WordRefl"{
    Properties{
        _MainTex("MainTex", 2D) = "white"{}
        _Cube("CubeMap", CUBE) = "" {}
    }

    SubShader {
        Tags {"RenderType" = "Opaque"}
        CGPROGRAM
        #pragma surface surf Lambert
        struct Input{
            float2 uv_MainTex;
            float3 worldRefl;
        };

        sampler2D _MainTex;
        samplerCUBE _Cube;

        void surf(Input IN, SurfaceOutput o){
            o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb * 0.5;
            o.Emission = texCUBE(_Cube, IN.worldRefl).rgb;
        }
        ENDCG
    }
    Fallback "Diffuse"
}