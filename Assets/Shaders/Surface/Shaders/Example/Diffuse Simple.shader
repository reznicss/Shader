Shader "Example/Diffuse Simple"{
    SubShader{
        Tags {"RenderType" = "Opaque"}
        CGPROGRAM
        //#pragma surface surfaceFunction(函数名称) lightModel(光照模型) [optionalparams]
        #pragma surface surf Lambert
        struct Input{
            float4 color : COLOR;
        };
        
        void surf(Input IN, inout SurfaceOutput o){
            o.Albedo = fixed4(1,1,1,1);
        }
        ENDCG
    }
    Fallback "Diffuse"
}