uniform vec4 u_v4PBR;

vec3 gamma(vec3 color)
{
	return pow(color, vec3(2.2));
}

vec3 invgamma(vec3 color)
{
	return pow(color, vec3(1.0 / 2.2));
}

vec3 uncharted2(vec3 color)
{
    const float A = 0.15;
    const float B = 0.50;
    const float C = 0.10;
    const float D = 0.20;
    const float E = 0.02;
    const float F = 0.30;
    const float W = 11.2;
	 return ((color * (A * color + C * B) + D * E) / (color * (A * color + B) + D * F)) - E / F;
}

vec3 toneMapACES(vec3 color)
{
    const float A = 2.51;
    const float B = 0.03;
    const float C = 2.43;
    const float D = 0.59;
    const float E = 0.14;
    return /*LINEARtoSRGB*/(clamp((color * (A * color + B)) / (color * (C * color + D) + E), 0.0, 1.0));
}

vec3 tonemap(vec3 color)
{
    //color *= u_v4PBR.y;
    //return uncharted2(color);
    return toneMapACES(color);
    //return color;
}


