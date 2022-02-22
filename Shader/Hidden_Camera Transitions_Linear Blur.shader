//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Camera Transitions/Linear Blur" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_SecondTex ("Second (RGB)", 2D) = "white" { }
_T ("Amount", Range(0, 1)) = 1
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 14814
Program "vp" {
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _T;
uniform 	float _Intensity;
uniform 	int _Passes;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec2 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_9;
int u_xlati26;
int u_xlati27;
bool u_xlatb29;
void main()
{
    u_xlat0.x = _T + -0.5;
    u_xlat0.x = -abs(u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x * _Intensity;
    u_xlat16_1 = float(_Passes);
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = int(0) ; u_xlati_loop_1<_Passes ; u_xlati_loop_1++)
    {
        u_xlat16_9 = float(u_xlati_loop_1);
        u_xlat16_9 = u_xlat16_9 / u_xlat16_1;
        u_xlat16_4.x = u_xlat16_9 + -0.5;
        u_xlat3.xyz = u_xlat8.xyz;
        u_xlat5.xyz = u_xlat2.xyz;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<_Passes ; u_xlati_loop_2++)
        {
            u_xlat16_9 = float(u_xlati_loop_2);
            u_xlat16_9 = u_xlat16_9 / u_xlat16_1;
            u_xlat16_4.y = u_xlat16_9 + -0.5;
            u_xlat6.xy = u_xlat0.xx * u_xlat16_4.xy + vs_TEXCOORD0.xy;
            u_xlat16_7.xyz = texture(_MainTex, u_xlat6.xy).xyz;
            u_xlat3.xyz = u_xlat3.xyz + u_xlat16_7.xyz;
            u_xlat16_6.xyz = texture(_SecondTex, u_xlat6.xy).xyz;
            u_xlat5.xyz = u_xlat5.xyz + u_xlat16_6.xyz;
        }
        u_xlat8.xyz = u_xlat3.xyz;
        u_xlat2.xyz = u_xlat5.xyz;
    }
    u_xlati0 = _Passes * _Passes;
    u_xlat16_1 = float(u_xlati0);
    u_xlat0.xyz = u_xlat8.xyz / vec3(u_xlat16_1);
    u_xlat2.xyz = u_xlat2.xyz / vec3(u_xlat16_1);
    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = vec3(_T) * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
""
}
}
}
}
Fallback "Transition Fallback"
}