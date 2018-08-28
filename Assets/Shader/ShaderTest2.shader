Shader "Custom/ShaderTest2" {
	Properties{
		_EmissiveColor("Emissive",Color)=(1,1,1,1)
		_AmbColor("Ambient",Color)=(1,1,1,1)
		_Slider("Range",Range(0,10)) = 2
	}
	SubShader{
		
		Tags{"RenderType"="Opaque"}
		LOD 200
		CGPROGRAM
		//声明一个函数入口 surf 
		#pragma surface surf Lambert

		float4 _EmissiveColor;
		float4 _AmbColor;
		float _Slider;
		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			//计算纹理与uv混合的颜色值，4维数组
			half4 c = pow((_EmissiveColor + _AmbColor),_Slider);
			o.Albedo = c.rgb;
			o.Alpha = c.a;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
