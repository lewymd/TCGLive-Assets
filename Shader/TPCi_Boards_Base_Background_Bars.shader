//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TPCi/Boards/Base_Background_Bars" {
Properties {
_MaskTextureRGBA ("Mask Texture (RGBA)", 2D) = "white" { }
_RedBarsTiling ("Red Bars Tiling", Vector) = (1,1,0,0)
_RedBarsPanning ("Red Bars Panning", Vector) = (0.3,0,0,0)
_GreenBarsTiling ("Green Bars Tiling", Vector) = (1,1,0,0)
_GreenBarsPanning ("Green Bars Panning", Vector) = (0.15,0,0,0)
_BlueBarsTiling ("Blue Bars Tiling", Vector) = (1,1,0,0)
_BlueBarsPanning ("Blue Bars Panning", Vector) = (0.05,0,0,0)
_AlphaBarsTiling ("Alpha Bars Tiling", Vector) = (1,1,0,0)
_AlphaBarsPanning ("Alpha Bars Panning", Vector) = (0.2,0,0,0)
_Color0 ("Color 0", Color) = (1,1,1,0)
_Color1 ("Color 1", Color) = (0,0,0,0)
_GradientTuning ("Gradient Tuning", Float) = 1
_texcoord2 ("", 2D) = "white" { }
_texcoord ("", 2D) = "white" { }
__dirty ("", Float) = 1
}
SubShader {
 Tags { "IsEmissive" = "true" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 50596
Program "vp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
float u_xlat10;
float u_xlat12;
mediump float u_xlat16_12;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_18;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
float u_xlat30;
float u_xlat31;
bool u_xlatb31;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat31 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat31 = u_xlat31 * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat2.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat2.xy;
    u_xlat22.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat22.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat22.xy;
    u_xlat3.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat3.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat3.xy;
    u_xlat23.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat23.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat23.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).x;
    u_xlat16_12 = texture(_MaskTextureRGBA, u_xlat22.xy).y;
    u_xlat2.x = u_xlat16_12 + u_xlat16_2;
    u_xlat16_12 = texture(_MaskTextureRGBA, u_xlat3.xy).z;
    u_xlat16_22 = texture(_MaskTextureRGBA, u_xlat23.xy).w;
    u_xlat12 = u_xlat16_22 + u_xlat16_12;
    u_xlat2.x = u_xlat12 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 + u_xlat2.x;
    u_xlat31 = min(u_xlat31, 1.0);
    u_xlat2.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb31 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb31){
        u_xlat31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat16_4.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat31 = min(u_xlat5.y, u_xlat5.x);
        u_xlat31 = min(u_xlat5.z, u_xlat31);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat31) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_34 = u_xlat16_3.w + -1.0;
    u_xlat16_34 = unity_SpecCube0_HDR.w * u_xlat16_34 + 1.0;
    u_xlat16_34 = log2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * unity_SpecCube0_HDR.y;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb31 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb31){
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb31 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb31){
            u_xlat31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat31 = inversesqrt(u_xlat31);
            u_xlat5.xyz = vec3(u_xlat31) * u_xlat16_4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat31 = min(u_xlat6.y, u_xlat6.x);
            u_xlat31 = min(u_xlat6.z, u_xlat31);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat31) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_5.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx;
        u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat16_3.xyz + (-u_xlat16_4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_4.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat31 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = abs(u_xlat30) + u_xlat1.x;
    u_xlat10 = u_xlat10 + 9.99999975e-06;
    u_xlat10 = 0.5 / u_xlat10;
    u_xlat10 = u_xlat1.x * u_xlat10;
    u_xlat10 = u_xlat10 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat10) * _LightColor0.xyz;
    u_xlat16_4.x = (-u_xlat0.x) + 1.0;
    u_xlat16_14.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_14.x;
    u_xlat16_4.x = u_xlat16_4.x * 0.959999979 + 0.0399999991;
    u_xlat16_14.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.x = -abs(u_xlat30) + 1.0;
    u_xlat16_18 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	mediump vec4 unity_SpecCube1_HDR;
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
UNITY_LOCATION(1) uniform mediump samplerCube unity_SpecCube0;
UNITY_LOCATION(2) uniform mediump samplerCube unity_SpecCube1;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
bvec3 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
bvec3 u_xlatb9;
float u_xlat10;
float u_xlat12;
mediump float u_xlat16_12;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_18;
vec2 u_xlat22;
mediump float u_xlat16_22;
vec2 u_xlat23;
float u_xlat30;
float u_xlat31;
bool u_xlatb31;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat1.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat31 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat31 = u_xlat31 * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat2.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat2.xy;
    u_xlat22.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat22.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat22.xy;
    u_xlat3.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat3.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat3.xy;
    u_xlat23.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat23.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat23.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).x;
    u_xlat16_12 = texture(_MaskTextureRGBA, u_xlat22.xy).y;
    u_xlat2.x = u_xlat16_12 + u_xlat16_2;
    u_xlat16_12 = texture(_MaskTextureRGBA, u_xlat3.xy).z;
    u_xlat16_22 = texture(_MaskTextureRGBA, u_xlat23.xy).w;
    u_xlat12 = u_xlat16_22 + u_xlat16_12;
    u_xlat2.x = u_xlat12 + u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 + u_xlat2.x;
    u_xlat31 = min(u_xlat31, 1.0);
    u_xlat2.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat2.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = vs_TEXCOORD1.xyz * (-u_xlat16_4.xxx) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0<unity_SpecCube0_ProbePosition.w);
#else
    u_xlatb31 = 0.0<unity_SpecCube0_ProbePosition.w;
#endif
    if(u_xlatb31){
        u_xlat31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
        u_xlat31 = inversesqrt(u_xlat31);
        u_xlat3.xyz = vec3(u_xlat31) * u_xlat16_4.xyz;
        u_xlat5.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat5.xyz = u_xlat5.xyz / u_xlat3.xyz;
        u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat6.xyz = u_xlat6.xyz / u_xlat3.xyz;
        u_xlatb7.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyzx).xyz;
        {
            vec3 hlslcc_movcTemp = u_xlat5;
            hlslcc_movcTemp.x = (u_xlatb7.x) ? u_xlat5.x : u_xlat6.x;
            hlslcc_movcTemp.y = (u_xlatb7.y) ? u_xlat5.y : u_xlat6.y;
            hlslcc_movcTemp.z = (u_xlatb7.z) ? u_xlat5.z : u_xlat6.z;
            u_xlat5 = hlslcc_movcTemp;
        }
        u_xlat31 = min(u_xlat5.y, u_xlat5.x);
        u_xlat31 = min(u_xlat5.z, u_xlat31);
        u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat31) + u_xlat5.xyz;
    } else {
        u_xlat3.xyz = u_xlat16_4.xyz;
    }
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat3.xyz, 6.0);
    u_xlat16_34 = u_xlat16_3.w + -1.0;
    u_xlat16_34 = unity_SpecCube0_HDR.w * u_xlat16_34 + 1.0;
    u_xlat16_34 = log2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * unity_SpecCube0_HDR.y;
    u_xlat16_34 = exp2(u_xlat16_34);
    u_xlat16_34 = u_xlat16_34 * unity_SpecCube0_HDR.x;
    u_xlat16_8.xyz = u_xlat16_3.xyz * vec3(u_xlat16_34);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(unity_SpecCube0_BoxMin.w<0.999989986);
#else
    u_xlatb31 = unity_SpecCube0_BoxMin.w<0.999989986;
#endif
    if(u_xlatb31){
#ifdef UNITY_ADRENO_ES3
        u_xlatb31 = !!(0.0<unity_SpecCube1_ProbePosition.w);
#else
        u_xlatb31 = 0.0<unity_SpecCube1_ProbePosition.w;
#endif
        if(u_xlatb31){
            u_xlat31 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
            u_xlat31 = inversesqrt(u_xlat31);
            u_xlat5.xyz = vec3(u_xlat31) * u_xlat16_4.xyz;
            u_xlat6.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat6.xyz = u_xlat6.xyz / u_xlat5.xyz;
            u_xlat7.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat7.xyz = u_xlat7.xyz / u_xlat5.xyz;
            u_xlatb9.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xyzx).xyz;
            {
                vec3 hlslcc_movcTemp = u_xlat6;
                hlslcc_movcTemp.x = (u_xlatb9.x) ? u_xlat6.x : u_xlat7.x;
                hlslcc_movcTemp.y = (u_xlatb9.y) ? u_xlat6.y : u_xlat7.y;
                hlslcc_movcTemp.z = (u_xlatb9.z) ? u_xlat6.z : u_xlat7.z;
                u_xlat6 = hlslcc_movcTemp;
            }
            u_xlat31 = min(u_xlat6.y, u_xlat6.x);
            u_xlat31 = min(u_xlat6.z, u_xlat31);
            u_xlat6.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat31) + u_xlat6.xyz;
        } else {
            u_xlat5.xyz = u_xlat16_4.xyz;
        }
        u_xlat16_5 = textureLod(unity_SpecCube1, u_xlat5.xyz, 6.0);
        u_xlat16_4.x = u_xlat16_5.w + -1.0;
        u_xlat16_4.x = unity_SpecCube1_HDR.w * u_xlat16_4.x + 1.0;
        u_xlat16_4.x = log2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.y;
        u_xlat16_4.x = exp2(u_xlat16_4.x);
        u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube1_HDR.x;
        u_xlat16_4.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx;
        u_xlat3.xyz = vec3(u_xlat16_34) * u_xlat16_3.xyz + (-u_xlat16_4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat3.xyz + u_xlat16_4.xyz;
        u_xlat16_8.xyz = u_xlat8.xyz;
    }
    u_xlat31 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat3.xyz = vec3(u_xlat31) * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10 = abs(u_xlat30) + u_xlat1.x;
    u_xlat10 = u_xlat10 + 9.99999975e-06;
    u_xlat10 = 0.5 / u_xlat10;
    u_xlat10 = u_xlat1.x * u_xlat10;
    u_xlat10 = u_xlat10 * 0.999999881;
    u_xlat1.xyz = vec3(u_xlat10) * _LightColor0.xyz;
    u_xlat16_4.x = (-u_xlat0.x) + 1.0;
    u_xlat16_14.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_14.x;
    u_xlat16_4.x = u_xlat16_4.x * 0.959999979 + 0.0399999991;
    u_xlat16_14.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.x = -abs(u_xlat30) + 1.0;
    u_xlat16_18 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_18;
    u_xlat16_8.x = u_xlat16_8.x * 2.23517418e-08 + 0.0399999991;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_8.xxx;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat16_14.xyz;
    SV_Target0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "DEFERRED"
  Tags { "IsEmissive" = "true" "LIGHTMODE" = "DEFERRED" "QUEUE" = "Geometry+0" "RenderType" = "Opaque" }
  GpuProgramID 107298
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat0.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat0.xy;
    u_xlat16_0 = texture(_MaskTextureRGBA, u_xlat0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).z;
    u_xlat2.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat2.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).w;
    u_xlat1.x = u_xlat16_2 + u_xlat16_1;
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat1.x * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat0.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat0.xy;
    u_xlat16_0 = texture(_MaskTextureRGBA, u_xlat0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).z;
    u_xlat2.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat2.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).w;
    u_xlat1.x = u_xlat16_2 + u_xlat16_1;
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat1.x * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = exp2((-u_xlat0.xyz));
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat0.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat0.xy;
    u_xlat16_0 = texture(_MaskTextureRGBA, u_xlat0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).z;
    u_xlat2.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat2.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).w;
    u_xlat1.x = u_xlat16_2 + u_xlat16_1;
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat1.x * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target3.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
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
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _texcoord2_ST;
uniform 	vec4 _texcoord_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * _texcoord2_ST.xy + _texcoord2_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _texcoord_ST.xy + _texcoord_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_0 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat16_2) + u_xlat16_3.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _Color1;
uniform 	vec4 _Color0;
uniform 	float _GradientTuning;
uniform 	vec2 _RedBarsPanning;
uniform 	vec2 _RedBarsTiling;
uniform 	vec2 _GreenBarsPanning;
uniform 	vec2 _GreenBarsTiling;
uniform 	vec2 _BlueBarsPanning;
uniform 	vec2 _BlueBarsTiling;
uniform 	vec2 _AlphaBarsPanning;
uniform 	vec2 _AlphaBarsTiling;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTextureRGBA;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
layout(location = 1) out mediump vec4 SV_Target1;
layout(location = 2) out mediump vec4 SV_Target2;
layout(location = 3) out mediump vec4 SV_Target3;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target1 = vec4(0.0399999991, 0.0399999991, 0.0399999991, 0.0);
    u_xlat0.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = 1.0;
    SV_Target2 = u_xlat0;
    u_xlat0.xy = vs_TEXCOORD0.zw * _RedBarsTiling.xy;
    u_xlat0.xy = _Time.yy * vec2(_RedBarsPanning.x, _RedBarsPanning.y) + u_xlat0.xy;
    u_xlat16_0 = texture(_MaskTextureRGBA, u_xlat0.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.zw * _GreenBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_GreenBarsPanning.x, _GreenBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).y;
    u_xlat0.x = u_xlat16_1 + u_xlat16_0;
    u_xlat1.xy = vs_TEXCOORD0.zw * _BlueBarsTiling.xy;
    u_xlat1.xy = _Time.yy * vec2(_BlueBarsPanning.x, _BlueBarsPanning.y) + u_xlat1.xy;
    u_xlat16_1 = texture(_MaskTextureRGBA, u_xlat1.xy).z;
    u_xlat2.xy = vs_TEXCOORD0.zw * _AlphaBarsTiling.xy;
    u_xlat2.xy = _Time.yy * vec2(_AlphaBarsPanning.x, _AlphaBarsPanning.y) + u_xlat2.xy;
    u_xlat16_2 = texture(_MaskTextureRGBA, u_xlat2.xy).w;
    u_xlat1.x = u_xlat16_2 + u_xlat16_1;
    u_xlat0.x = u_xlat1.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat1.x = u_xlat1.x * _GradientTuning;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + u_xlat1.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.xyz = (-_Color1.xyz) + _Color0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + _Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target3.xyz = u_xlat0.xyz;
    SV_Target3.w = 1.0;
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
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 " {
Keywords { "LIGHTPROBE_SH" "UNITY_HDR_ON" }
""
}
}
}
}
CustomEditor "ASEMaterialInspector"
}