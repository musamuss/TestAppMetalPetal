//
//  CustomBrightnessFilter.metal
//  TestAppMetalPetal
//
//  Created by Musa on 28.07.2023.
//

#include <metal_stdlib>
#include "MTIShaderLib.h"
#include "MTIShaderFunctionConstants.h"
using namespace metal;

fragment float4 imageBrightness(metalpetal::VertexOut vertexIn [[stage_in]],
                                 texture2d<float, access::sample> sourceTexture [[texture(0)]],
                                 sampler sourceSampler [[sampler(0)]],
                                 constant float &brightness [[buffer(0)]]) {
    if (brightness == 0) {
        return sourceTexture.sample(sourceSampler, vertexIn.textureCoordinate);
    }
    float3 color = sourceTexture.sample(sourceSampler, vertexIn.textureCoordinate).rgb;

    color = color * (1 + brightness);
    return float4(color, 1);
}
