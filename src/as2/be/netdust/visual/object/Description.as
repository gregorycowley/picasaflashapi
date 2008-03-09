﻿/** * Copyright (c) 2007 Stefan Vandermeulen - netdust.be 
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
import be.netdust.visual.object.Label;

class be.netdust.visual.object.Description extends Label
{
	public var styleClass:String = "Description";
	public function Description( _sValue:String, _styleID ) {
		super( _sValue, _styleID );	
	};
	
	public function setLabel( val:String ) 
	{
		super.setLabel( val )
		_labeltf.html = true;
		_labeltf.autoSize = "right";
		_labeltf.htmlText = getLabel();
	};
	
	public function getLabel() : String
	{
		return label;
	};
	
	public function doLayout() : Void
	{
		setLabel( getLabel() );		
		
		width = _labeltf._width + getStyle().hpadding;
		height = _labeltf._height + getStyle().vpadding;
	};
	
	private function setup() 
	{
		super.setup();
		_labeltf.html = true;
		_labeltf.wordWrap = true;
		_labeltf.multiline = true;
	}
}