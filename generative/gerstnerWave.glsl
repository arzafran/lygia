#include "../math/const.glsl"

#ifndef FNC_GERSTNERWAVE
#define FNC_GERSTNERWAVE

vec3 gerstnerWave (in vec2 _uv, in vec2 _dir, in float _steepness, in float _wavelength, in float _time, inout vec3 _tangent, inout vec3 _binormal) {
    float k = 2.0 * PI / _wavelength;
    float c = sqrt(9.8 / k);
    vec2 d = normalize(_dir);
    float f = k * (dot(d, _uv) - c * _time);
    float a = _steepness / k;

    _tangent += vec3(
        -d.x * d.x * (_steepness * sin(f)),
        d.x * (_steepness * cos(f)),
        -d.x * d.y * (_steepness * sin(f))
    );
    _binormal += vec3(
        -d.x * d.y * (_steepness * sin(f)),
        d.y * (_steepness * cos(f)),
        -d.y * d.y * (_steepness * sin(f))
    );
    return vec3(
        d.x * (a * cos(f)),
        a * sin(f),
        d.y * (a * cos(f))
    );
}

// vec3 gerstnerWave (in vec2 _uv, in vec2 _dir, in float _steepness, in float _wavelength, inout vec3 _normal) {
//     vec3 _tangent;
//     vec3 _binormal;
//     vec3 pos = gerstnerWave (_uv, _dir, _steepness, _wavelength, _tangent, _binormal);
//     _normal = normalize(cross(_binormal, _tangent));
//     return pos;
// }

// vec3 gerstnerWave (in vec2 _uv, in vec2 _dir, in float _steepness, in float _wavelength) {
//     vec3 _tangent;
//     vec3 _binormal;
//     return gerstnerWave (_uv, _dir, _steepness, _wavelength, _tangent, _binormal);
// }

#endif