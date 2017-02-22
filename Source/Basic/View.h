/* Copyright (c) 2017 Jin Li, http://www.luvfight.me

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. */

#pragma once

#include "Support/Geometry.h"

NS_DOROTHY_BEGIN

class View
{
public:
	PROPERTY_READONLY(Size, Size);
	PROPERTY_READONLY(float, StandardDistance);
	PROPERTY_READONLY(float, AspectRatio);
	PROPERTY_READONLY(const float*, Projection);
	PROPERTY(float, NearPlaneDistance);
	PROPERTY(float, FarPlaneDistance);
	PROPERTY(float, FieldOfView);
	PROPERTY_BOOL(VSync);
	void reset();
protected:
	View();
	void updateProjection();
private:
	Uint32 _flag;
	float _nearPlaneDistance;
	float _farPlaneDistance;
	float _fieldOfView;
	float _projection[16];
	DORA_TYPE(View);
	SINGLETON(View, "Director");
};

#define SharedView \
	Dorothy::Singleton<Dorothy::View>::shared()

NS_DOROTHY_END
