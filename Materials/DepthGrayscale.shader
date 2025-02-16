﻿// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// // Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader "Custom/DepthGrayscale" 
// {
//    SubShader 
//    {
//       Tags { "RenderType"="Opaque" }

//       Pass
//       {
//          CGPROGRAM
//          #pragma vertex vert
//          #pragma fragment frag
//          #include "UnityCG.cginc"

//          sampler2D _CameraDepthTexture;

//          struct v2f {
//             float4 pos : SV_POSITION;
//             float4 scrPos : TEXCOORD1;
//       };

//       // Vertex Shader
//       v2f vert (appdata_base v)
//       {
//          v2f o;
//          o.pos = UnityObjectToClipPos (v.vertex);
//          o.scrPos = ComputeScreenPos(o.pos);
//          // for some reason, the y position of the depth texture comes out inverted
//          return o;
//       }

//       //Fragment Shader
//       half4 frag (v2f i) : COLOR{
//          float depthValue = Linear01Depth (tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.scrPos)).r);
//          half4 depth;

//          depth.r = depthValue;
//          depth.g = depthValue;
//          depth.b = depthValue;

//          depth.a = 1;
//          return depth;
//       }
//       ENDCG
//       }
//    }
//    FallBack "Diffuse"
// }
Shader "Custom/DepthGrayscale" 
{
    SubShader
    {
        Tags { "RenderType"="Opaque" }
       
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
 
            struct v2f
            {
                float4 pos : SV_POSITION;
                float4 screenuv : TEXCOORD1;
            };
           
            v2f vert (appdata_base v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenuv = ComputeScreenPos(o.pos);
                return o;
            }
           
            sampler2D _CameraDepthTexture;
 
            fixed4 frag (v2f i) : SV_Target
            {
                float2 uv = i.screenuv.xy / i.screenuv.w;
                float depth = Linear01Depth(SAMPLE_DEPTH_TEXTURE(_CameraDepthTexture, uv)) + 0.07;
                return fixed4(depth, depth, depth, 1);
            }
            ENDCG
        }
    }
}