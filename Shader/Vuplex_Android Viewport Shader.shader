//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Vuplex/Android Viewport Shader" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
[Toggle(FLIP_X)] _FlipX ("Flip X", Float) = 0
[Toggle(FLIP_Y)] _FlipY ("Flip Y", Float) = 0
[Header(Properties set programmatically)] _VideoCutoutRect ("Video Cutout Rect", Vector) = (0,0,0,0)
_CropRect ("Crop Rect", Vector) = (0,0,0,0)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  GpuProgramID 7553
Program "vp" {
SubProgram "gles3 " {
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_Y" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_Y 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_Y" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_Y 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define FLIP_Y 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define FLIP_Y 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
}
Program "fp" {
SubProgram "gles3 " {
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 54

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_Y" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_Y 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_Y" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_Y 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 55

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define FLIP_Y 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 56

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
SubProgram "gles3 " {
Keywords { "FLIP_X" "FLIP_Y" "UNITY_COLORSPACE_GAMMA" }
"#version 300 es
#extension GL_OES_EGL_image_external : require
#extension GL_OES_EGL_image_external_essl3 : enable
#define UNITY_NO_DXT5nm 1
#define UNITY_NO_RGBM 1
#define UNITY_ENABLE_REFLECTION_BUFFERS 1
#define UNITY_FRAMEBUFFER_FETCH_AVAILABLE 1
#define UNITY_NO_CUBEMAP_ARRAY 1
#define UNITY_NO_SCREENSPACE_SHADOWS 1
#define UNITY_PBS_USE_BRDF1 1
#define UNITY_SPECCUBE_BOX_PROJECTION 1
#define UNITY_SPECCUBE_BLENDING 1
#define UNITY_ENABLE_DETAIL_NORMALMAP 1
#define SHADER_API_MOBILE 1
#define UNITY_LIGHTMAP_DLDR_ENCODING 1
#define FLIP_X 1
#define FLIP_Y 1
#define UNITY_COLORSPACE_GAMMA 1
#ifndef SHADER_TARGET
    #define SHADER_TARGET 25
#endif
#ifndef SHADER_REQUIRE_DERIVATIVES
    #define SHADER_REQUIRE_DERIVATIVES 1
#endif
#ifndef SHADER_TARGET_AVAILABLE
    #define SHADER_TARGET_AVAILABLE 35
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS10
    #define SHADER_AVAILABLE_INTERPOLATORS10 1
#endif
#ifndef SHADER_AVAILABLE_INTERPOLATORS15
    #define SHADER_AVAILABLE_INTERPOLATORS15 1
#endif
#ifndef SHADER_AVAILABLE_INTEGERS
    #define SHADER_AVAILABLE_INTEGERS 1
#endif
#ifndef SHADER_AVAILABLE_MRT4
    #define SHADER_AVAILABLE_MRT4 1
#endif
#ifndef SHADER_AVAILABLE_DERIVATIVES
    #define SHADER_AVAILABLE_DERIVATIVES 1
#endif
#ifndef SHADER_AVAILABLE_SAMPLELOD
    #define SHADER_AVAILABLE_SAMPLELOD 1
#endif
#ifndef SHADER_AVAILABLE_FRAGCOORD
    #define SHADER_AVAILABLE_FRAGCOORD 1
#endif
#ifndef SHADER_AVAILABLE_2DARRAY
    #define SHADER_AVAILABLE_2DARRAY 1
#endif
#ifndef SHADER_AVAILABLE_INSTANCING
    #define SHADER_AVAILABLE_INSTANCING 1
#endif
#ifndef SHADER_API_GLES3
    #define SHADER_API_GLES3 1
#endif
#line 1
#ifndef GLSL_SUPPORT_INCLUDED
#define GLSL_SUPPORT_INCLUDED

// Automatically included in raw GLSL (GLSLPROGRAM) shader snippets, to map from some of the legacy OpenGL
// variable names to uniform names used by Unity.

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif

uniform mat4 unity_ObjectToWorld;
uniform mat4 unity_WorldToObject;
uniform mat4 unity_MatrixVP;
uniform mat4 unity_MatrixV;
uniform mat4 unity_MatrixInvV;
uniform mat4 glstate_matrix_projection;

#define gl_ModelViewProjectionMatrix        (unity_MatrixVP * unity_ObjectToWorld)
#define gl_ModelViewMatrix                  (unity_MatrixV * unity_ObjectToWorld)
#define gl_ModelViewMatrixTranspose         (transpose(unity_MatrixV * unity_ObjectToWorld))
#define gl_ModelViewMatrixInverseTranspose  (transpose(unity_WorldToObject * unity_MatrixInvV))
#define gl_NormalMatrix                     (transpose(mat3(unity_WorldToObject * unity_MatrixInvV)))
#define gl_ProjectionMatrix                 glstate_matrix_projection

#if __VERSION__ < 120
#ifndef UNITY_GLSL_STRIP_TRANSPOSE
mat3 transpose(mat3 mtx)
{
    vec3 c0 = mtx[0];
    vec3 c1 = mtx[1];
    vec3 c2 = mtx[2];

    return mat3(
        vec3(c0.x, c1.x, c2.x),
        vec3(c0.y, c1.y, c2.y),
        vec3(c0.z, c1.z, c2.z)
    );
}
mat4 transpose(mat4 mtx)
{
    vec4 c0 = mtx[0];
    vec4 c1 = mtx[1];
    vec4 c2 = mtx[2];
    vec4 c3 = mtx[3];

    return mat4(
        vec4(c0.x, c1.x, c2.x, c3.x),
        vec4(c0.y, c1.y, c2.y, c3.y),
        vec4(c0.z, c1.z, c2.z, c3.z),
        vec4(c0.w, c1.w, c2.w, c3.w)
    );
}
#endif
#endif // __VERSION__ < 120

#endif // GLSL_SUPPORT_INCLUDED

#line 57

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif

#line 57
#ifdef DUMMY_PREPROCESSOR_TO_WORK_AROUND_HLSL_COMPILER_LINE_HANDLING
#endif
/* UNITY: Original start of shader */
                // #pragma only_renderers gles gles3
                
                

                // #pragma multi_compile ___ FLIP_X
                // #pragma multi_compile ___ FLIP_Y
                // #pragma multi_compile _ UNITY_COLORSPACE_GAMMA

                precision mediump int;
                precision mediump float;

                
                            

#ifdef VERTEX
#define gl_Vertex _glesVertex
in vec4 _glesVertex;
#define gl_Color _glesColor
in vec4 _glesColor;
#define gl_MultiTexCoord0 _glesMultiTexCoord0
in vec4 _glesMultiTexCoord0;

                    uniform mat4 video_matrix;
                    uniform int unity_StereoEyeIndex;
                    out vec2 uv;
                    // Pass the vertex color to the fragment shader
                    // so that it can be used for calculating alpha.
                    // This is needed, for example, to allow CanvasGroup.alpha
                    // to control the alpha.
                    out vec4 vertexColor;

                    void main() {
                        gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
                        vec4 untransformedUV = gl_MultiTexCoord0;
                        vertexColor = gl_Color;
                        #ifdef FLIP_X
                            untransformedUV.x = 1.0 - untransformedUV.x;
                        #endif
                        #ifdef FLIP_Y
                            untransformedUV.y = 1.0 - untransformedUV.y;
                        #endif

                        uv = (video_matrix * untransformedUV).xy;
                    }
                
#endif
#ifdef FRAGMENT
#define gl_FragColor _glesFragColor
layout(location = 0) out mediump vec4 _glesFragColor;

precision highp float;


                    // A port of GammaToLinearSpace from UnityCG.cginc
                    vec3 GammaToLinearSpace (vec3 sRGB) {

                        return sRGB * (sRGB * (sRGB * 0.305306011 + 0.682171111) + 0.012522878);
                    }

                    uniform samplerExternalOES _MainTex;
                    uniform vec4 _VideoCutoutRect;
                    uniform vec4 _CropRect;
                    in vec2 uv;
                    in vec4 vertexColor;

                    void main() {

                        vec4 col = texture(_MainTex, uv);
                        float cutoutWidth = _VideoCutoutRect.z;
                        float cutoutHeight = _VideoCutoutRect.w;

                        #ifdef FLIP_X
                            float nonflippedX = 1.0 - uv.x;
                        #else
                            float nonflippedX = uv.x;
                        #endif
                        #ifdef FLIP_Y
                            float nonflippedY = uv.y;
                        #else
                            float nonflippedY = 1.0 - uv.y;
                        #endif

                        // Make the pixels transparent if they fall within the video rect cutout and the they're black.
                        // Keeping non-black pixels allows the video controls to still show up on top of the video.
                        bool pointIsInCutout = cutoutWidth != 0.0 &&
                                               cutoutHeight != 0.0 &&
                                               nonflippedX >= _VideoCutoutRect.x &&
                                               nonflippedX <= _VideoCutoutRect.x + cutoutWidth &&
                                               nonflippedY >= _VideoCutoutRect.y &&
                                               nonflippedY <= _VideoCutoutRect.y + cutoutHeight;

                        if (pointIsInCutout) {
                            // Use a threshold of 0.15 to consider a pixel as black.
                            bool pixelIsBlack = all(lessThan(col.xyz, vec3(0.15, 0.15, 0.15)));
                            if (pixelIsBlack) {
                                col = vec4(0.0, 0.0, 0.0, 0.0);
                            }
                        }

                        float cropWidth = _CropRect.z;
                        float cropHeight = _CropRect.w;
                        bool pointIsOutsideOfCrop = cropWidth != 0.0 &&
                                                    cropHeight != 0.0 &&
                                                    (nonflippedX < _CropRect.x || nonflippedX > _CropRect.x + cropWidth || nonflippedY < _CropRect.y || nonflippedY > _CropRect.y + cropHeight);
                        if (pointIsOutsideOfCrop) {
                            col = vec4(0.0, 0.0, 0.0, 0.0);
                        }

                        // Place color correction last so it doesn't effect cutout rect functionality.
                        #ifndef UNITY_COLORSPACE_GAMMA
                            col = vec4(GammaToLinearSpace(col.xyz), col.w);
                        #endif

                        // Multiply the alpha by the vertex color's alpha to support CanvasGroup.alpha.
                        gl_FragColor = vec4(col.xyz, col.w * vertexColor.w);
                    }
                
#endif"
}
}
}
}
Fallback "Unlit/Texture"
}