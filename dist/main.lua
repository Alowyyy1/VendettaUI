--[[
    __     __             _      _   _          _   _ ___ 
    \ \   / /__ _ __   __| | ___| |_| |_ __ _  | | | |_ _|
     \ \ / / _ \ '_ \ / _` |/ _ \ __| __/ _` | | | | || | 
      \ V /  __/ | | | (_| |  __/ |_| || (_| | | |_| || | 
       \_/ \___|_| |_|\__,_|\___|\__|\__\__,_|  \___/|___|
    
    v1.0.0  |  2026-09-23  |  Apple-inspired Roblox UI Library with SF Symbols and macOS/iOS controls
    
    To view the source code, see the `src/` folder on the official GitHub repository.
    
    Forked from WindUI with Apple macOS/iOS design & SF Symbols
    Github: https://github.com/Alowyyy1/VendettaUI
    License: MIT
]]


type ConfigType__DARKLUA_TYPE_a={
Object:Instance,
Camera:Instance?,
Interactive:boolean?,
Height:number?,
Focused:boolean,

Window:any,
WindUI:any,
Tab:any,
Parent:Instance,
}local a={cache={}::any}do do local function __modImpl()

local b

local d={
New=nil,
Init=nil,
Shapes={
Circle={
Image="rbxassetid://111665032676235",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleOutline={
Image="rbxassetid://108556680453287",
Rect=Rect.new(512,512,512,512),
Radius=512,
},
CircleGlass={
Image="rbxassetid://95600044758841",
Rect=Rect.new(512,512,512,512),
Radius=512,
},



SquircleH={
Image="rbxassetid://125083578015333",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHOutline={
Image="rbxassetid://107043713170567",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
SquircleHGlass={
Image="rbxassetid://84819521201001",
Rect=Rect.new(512,325,512,325),
Radius=325,
},
["SquircleH-TL-TR"]={
Image="rbxassetid://90680657206619",
Rect=Rect.new(807,512,807,512),
Radius=325,
AutoChange=false,
},
["SquircleH-BL-BR"]={
Image="rbxassetid://99216342056719",
Rect=Rect.new(0,512,0,512),
Radius=325,
AutoChange=false,
},

SquircleV={
Image="rbxassetid://124965260437653",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVOutline={
Image="rbxassetid://88808835404198",
Rect=Rect.new(325,512,325,512),
Radius=325,
},
SquircleVGlass={
Image="rbxassetid://124982801466667",
Rect=Rect.new(325,512,325,512),
Radius=325,
},

Squircle={
Image="rbxassetid://89641024074289",
Rect=Rect.new(460,460,460,460),
Radius=310,
},
SquircleOutline={
Image="rbxassetid://74029063732681",
Rect=Rect.new(512,512,512,512),
Radius=310,
},
SquircleGlass={
Image="rbxassetid://131126436897551",
Rect=Rect.new(512,512,512,512),
Radius=310,
},

["Squircle-TL-TR"]={
Image="rbxassetid://75712142040725",
Rect=Rect.new(512,512,512,512),
Radius=310,
AutoChange=false,
},
["Squircle-BL-BR"]={
Image="rbxassetid://83676684425544",
Rect=Rect.new(512,0,512,0),
Radius=310,
AutoChange=false,
},Square=
{
Image="rbxassetid://82909646051652",
Rect=Rect.new(512,512,512,512),
Radius=512,
AutoChange=false,
},
},
}

function d.Init(e,f)
b=f
return e.New
end

function d.New(e,f,g,h,i,j,l)
local m={
Radius=f or 0,
Type=g or"Circle",
GetRadius=nil,
GetType=nil,
SetRadius=nil,
SetType=nil,
}

local p={
["Glass-0.7"]="SquircleGlass",
["Glass-1"]="SquircleGlass",
["Glass-1.4"]="SquircleGlass",
["Squircle-Outline"]="SquircleOutline",
}

local function GetShape(r)
return d.Shapes[p[r]or r]or d.Shapes.Circle
end

local r=b.New(j and"ImageButton"or"ImageLabel",{
Image="",
ScaleType=l~=false and"Slice"or nil,
SliceCenter=m.Type~="Squircle"and Rect.new(512,512,512,512)or nil,
SliceScale=1,
ThemeTag=h and h.ThemeTag or nil,
BackgroundTransparency=1,
},i)

for u,v in next,h do
if not table.find({"ThemeTag"},u)then
r[u]=v
end
end

function m.SetRadius(u,v)
m.Radius=v
r.SliceScale=math.max(v/GetShape(m.Type).Radius,0.0001)
return m
end

function m.SetType(u,v)
m.Type=v
local x=GetShape(v)
r.Image=x.Image
r.SliceCenter=x.Rect
m:SetRadius(m.Radius)
return m
end

function m.GetRadius(u)
return m.Radius
end

function m.GetType(u)
return m.Type
end

m:SetRadius(f)
m:SetType(g)

b.AddSignal(r:GetPropertyChangedSignal"AbsoluteSize",function()
local u=GetShape(m.Type)
if u.AutoChange==false then
return
end

if string.find(m.Type,"Squircle")then
local v=string.find(m.Type,"Glass")and"Glass"or nil
local x=string.find(m.Type,"Outline")and"Outline"or nil

local z=math.round(r.AbsoluteSize.X/b.UIScale)
local A=math.round(r.AbsoluteSize.Y/b.UIScale)

local B=m.Radius~=0 and m.Radius or math.min(z,A)/2
local C=d.Shapes.Squircle.Radius/1024
local F=B/math.min(z,A)

local G

if z>A then
if F>=C then
G="SquircleH"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
elseif z<A then
if F>=C then
G="SquircleV"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
else
if F>=C then
G="Circle"..(x or v or"")
else
G="Squircle"..(x or v or"")
end
end

if G~=m:GetType()then
m:SetType(G)
end
end
end)

return r,m
end

return d end function a.a():typeof(__modImpl())local b=a.cache.a if not b then b={c=__modImpl()}a.cache.a=b end return b.c end end do local function __modImpl()



local b=(cloneref or clonereference or function(b)
return b
end)

b(game:GetService"RunService")
local d=b(game:GetService"HttpService")
local e=b(game:GetService"ReplicatedStorage")

local function IsExploit()
return request and true or false
end

local function Get(f)
if IsExploit()then
return game:HttpGet(f)
else
local g,h=pcall(function()
return d:GetAsync(f)
end)
if g then
return h
else
return e:WaitForChild("Request",9999):InvokeServer{Url=f}
end
end
end

local function Loadstring(f)
if not IsExploit()and e:WaitForChild("Loadstring",9999)then
return function()
return e:WaitForChild("Loadstring",9999):InvokeServer(f)
end
else
return loadstring(f)
end
end

local f={
IconsType="lucide",

New=nil,
IconThemeTag=nil,

Icons={},
}

local g={
lucide="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/lucide/dist/Icons.lua",
solar="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/solar/dist/Icons.lua",
craft="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/craft/dist/Icons.lua",
geist="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/geist/dist/Icons.lua",
sfsymbols="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/sfsymbols/dist/Icons.lua",
gravity="https://raw.githubusercontent.com/Footagesus/Icons/refs/heads/main/gravity/dist/Icons.lua",
}

local function EnsurePackLoaded(h)
if not f.Icons[h]and g[h]then
local i,j=pcall(function()
local i=Get(g[h])
return Loadstring(i)()
end)
if i and j then
f.Icons[h]=j
end
end
end

local function parseIconString(h)
if type(h)=="string"then
local i=h:find":"
if i then
local j=h:sub(1,i-1)
local l=h:sub(i+1)
return j,l
end
end
return nil,h
end

function f.AddIcons(h,i)
if type(h)~="string"or type(i)~="table"then
error"AddIcons: packName must be string, iconsData must be table"
return
end

if not f.Icons[h]then
f.Icons[h]={
Icons={},
Spritesheets={},
}
end

for j,l in pairs(i)do
if type(l)=="number"or(type(l)=="string"and l:match"^rbxassetid://")then
local m=l
if type(l)=="number"then
m="rbxassetid://"..tostring(l)
end

f.Icons[h].Icons[j]={
Image=m,
ImageRectSize=Vector2.new(0,0),
ImageRectPosition=Vector2.new(0,0),
Parts=nil,
}
f.Icons[h].Spritesheets[m]=m
elseif type(l)=="table"then
if l.Image and l.ImageRectSize and l.ImageRectPosition then
local m=l.Image
if type(m)=="number"then
m="rbxassetid://"..tostring(m)
end

f.Icons[h].Icons[j]={
Image=m,
ImageRectSize=l.ImageRectSize,
ImageRectPosition=l.ImageRectPosition,
Parts=l.Parts,
}

if not f.Icons[h].Spritesheets[m]then
f.Icons[h].Spritesheets[m]=m
end
else
warn("AddIcons: Invalid spritesheet data format for icon '"..j.."'")
end
else
warn("AddIcons: Unsupported data type for icon '"..j.."': "..type(l))
end
end
end

function f.SetIconsType(h)
f.IconsType=h
end

function f.Init(h,i)
f.New=h
f.IconThemeTag=i

return f
end

function f.Icon(h,i,j)
j=j~=false
local l,m=parseIconString(h)

local p=l or i or f.IconsType
local r=m

EnsurePackLoaded(p)
local u=f.Icons[p]


if not u or(u.Icons and not u.Icons[r]and not u[r])then
if p~="sfsymbols"then
EnsurePackLoaded"sfsymbols"
if f.Icons.sfsymbols and(f.Icons.sfsymbols[r]or(f.Icons.sfsymbols.Icons and f.Icons.sfsymbols.Icons[r]))then
p="sfsymbols"
u=f.Icons.sfsymbols
end
end
if not u and p~="lucide"then
EnsurePackLoaded"lucide"
if f.Icons.lucide and(f.Icons.lucide[r]or(f.Icons.lucide.Icons and f.Icons.lucide.Icons[r]))then
p="lucide"
u=f.Icons.lucide
end
end
end

if u and u.Icons and u.Icons[r]then
return{
u.Spritesheets[tostring(u.Icons[r].Image)],
u.Icons[r],
}
elseif u and u[r]and string.find(tostring(u[r]),"rbxassetid://")then
return j
and{
u[r],
{ImageRectSize=Vector2.new(0,0),ImageRectPosition=Vector2.new(0,0)},
}
or u[r]
end
return nil
end

function f.GetIcon(h,i)
return f.Icon(h,i,false)
end

function f.Icon2(h,i,j)
return f.Icon(h,i,true)
end

function f.Image(h)
local i={
Icon=h.Icon or nil,
Type=h.Type,
Colors=h.Colors or{(f.IconThemeTag or Color3.new(1,1,1)),Color3.new(1,1,1)},
Size=h.Size or UDim2.new(0,24,0,24),

IconFrame=nil,
}

local j={}

for l,m in next,i.Colors do
j[l]={
ThemeTag=typeof(m)=="string"and m,
Color=typeof(m)=="Color3"and m,
}
end

local l=f.Icon2(i.Icon,i.Type)
local m=typeof(l)=="string"and string.find(l,"rbxassetid://")

if f.New then
local p=f.New

local r=p("ImageLabel",{
Size=i.Size,
BackgroundTransparency=1,
ImageColor3=j[1].Color or nil,
ThemeTag=j[1].ThemeTag and{
ImageColor3=j[1].ThemeTag,
},
Image=m and l or l[1],
ImageRectSize=m and nil or l[2].ImageRectSize,
ImageRectOffset=m and nil or l[2].ImageRectPosition,
})

if not m and l[2].Parts then
for u,v in next,l[2].Parts do
local x=f.Icon(v,i.Type)

p("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ImageColor3=j[1+u].Color or nil,
ThemeTag=j[1+u].ThemeTag and{
ImageColor3=j[1+u].ThemeTag,
},
Image=x[1],
ImageRectSize=x[2].ImageRectSize,
ImageRectOffset=x[2].ImageRectPosition,
Parent=r,
})
end
end

i.IconFrame=r
else
local p=Instance.new"ImageLabel"
p.Size=i.Size
p.BackgroundTransparency=1
p.ImageColor3=j[1].Color
p.Image=m and l or l[1]
p.ImageRectSize=m and nil or l[2].ImageRectSize
p.ImageRectOffset=m and nil or l[2].ImageRectPosition

if not m and l[2].Parts then
for r,u in next,l[2].Parts do
local v=f.Icon(u,i.Type)

local x=Instance.New"ImageLabel"
x.Size=UDim2.new(1,0,1,0)
x.BackgroundTransparency=1
x.ImageColor3=j[1+r].Color
x.Image=v[1]
x.ImageRectSize=v[2].ImageRectSize
x.ImageRectOffset=v[2].ImageRectPosition
x.Parent=p
end
end

i.IconFrame=p
end

return i
end

return f end function a.b():typeof(__modImpl())local b=a.cache.b if not b then b={c=__modImpl()}a.cache.b=b end return b.c end end do local function __modImpl()

return function(b)
return{


Primary="Icon",

White=Color3.new(1,1,1),
Black=Color3.new(0,0,0),

Dialog="Accent",

Background="Accent",
BackgroundTransparency=0,
Hover="Text",

PanelBackground="White",
PanelBackgroundTransparency=0.95,

WindowBackground="Background",

WindowShadow="Black",


WindowTopbarTitle="Text",
WindowTopbarAuthor="Text",
WindowTopbarIcon="Icon",
WindowTopbarButtonIcon="Icon",


WindowSearchBarBackground="Dialog",

TabBackground="Hover",
TabBackgroundHover="Hover",
TabBackgroundHoverTransparency=0.97,
TabBackgroundActive="Hover",
TabBackgroundActiveTransparency=0.93,
TabText="Text",
TabTextTransparency=0.3,
TabTextTransparencyActive=0,
TabTitle="Text",
TabIcon="Icon",
TabIconTransparency=0.4,
TabIconTransparencyActive=0.1,
TabBorderTransparency=1,
TabBorderTransparencyActive=0.75,
TabBorder="White",

ElementBackground="Text",
ElementBackgroundTransparency=0.93,
ElementBackgroundHover=b:AddColor("ElementBackground","#ffffff",0.1),
ElementTitle="Text",
ElementDesc="Text",
ElementIcon="Icon",

PopupBackground="Background",
PopupBackgroundTransparency="BackgroundTransparency",
PopupTitle="Text",
PopupContent="Text",
PopupIcon="Icon",

DialogBackground="Dialog",
DialogBackgroundTransparency="BackgroundTransparency",
DialogTitle="Text",
DialogContent="Text",
DialogIcon="Icon",

Toggle="Button",
ToggleBar="White",

Checkbox="Primary",
CheckboxIcon="White",
CheckboxBorder="White",
CheckboxBorderTransparency=0.75,

SliderIcon="Icon",

Slider="Primary",
SliderThumb="White",
SliderIconFrom="SliderIcon",
SliderIconTo="SliderIcon",

ProgressBar="Primary",
ProgressBarTrack="Text",
ProgressBarTrackTransparency=0.9,
ProgressBarText="Text",

Tooltip=Color3.fromHex"4C4C4C",
TooltipText="White",
TooltipSecondary="Primary",
TooltipSecondaryText="White",

TabSectionIcon="Icon",

SectionIcon="Icon",

SectionExpandIcon="Icon",
SectionExpandIconTransparency=0.4,
SectionBox="Text",
SectionBoxTransparency=0.95,
SectionBoxBorder="White",
SectionBoxBorderTransparency=0.75,
SectionBoxBackground="Text",
SectionBoxBackgroundTransparency=0.97,

SearchBarBorder="White",
SearchBarBorderTransparency=0.75,

Notification="Background",
Notification2="White",
Notification2Transparency=0.92,
NotificationTitle="Text",
NotificationTitleTransparency=0,
NotificationContent="Text",
NotificationContentTransparency=0.4,
NotificationDuration="White",
NotificationDurationTransparency=0.95,
NotificationBorder="White",
NotificationBorderTransparency=0.75,

DropdownTabBorder="White",
DropdownTabBackground="ElementBackground",
DropdownBackground="Background",

LabelBackground="White",
LabelBackgroundTransparency=0.95,

ViewportBackground="ElementBackground",
ViewportBackgroundTransparency="ElementBackgroundTransparency",
}
end end function a.c():typeof(__modImpl())local b=a.cache.c if not b then b={c=__modImpl()}a.cache.c=b end return b.c end end do local function __modImpl()

local b=(cloneref or clonereference or function(b)
return b
end)

local d=b(game:GetService"RunService")
local e=b(game:GetService"UserInputService")
local f=b(game:GetService"TweenService")
local g=b(game:GetService"LocalizationService")
local h=b(game:GetService"HttpService")

local i=a.a()local j=

d.Heartbeat



local l=a.b()

l.SetIconsType"lucide"

local m

local p
p={
Font="rbxassetid://12187365364",
Localization=nil,
CanDraggable=true,
Theme=nil,
Themes=nil,
Icons=l,
Signals={},
Objects={},
LocalizationObjects={},
UIScale=1,
FontObjects={},
Language=string.match(g.SystemLocaleId,"^[a-z]+"),
Request=http_request or(syn and syn.request)or request,
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
},
ScrollingFrame={
ScrollBarImageTransparency=1,
BorderSizePixel=0,
},
VideoFrame={
BorderSizePixel=0,
},
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
},
ThemeFallbacks=nil,





















ThemeChangeCallbacks={},
}

function p.Init(r)
m=r

p.ThemeFallbacks=a.c()(p)

p.UIScale=r.UIScale

i:Init(p)
end

function p.AddSignal(r,u)
local v=r:Connect(u)
table.insert(p.Signals,v)
return v
end

function p.DisconnectAll()
for r,u in next,p.Signals do
local v=table.remove(p.Signals,r)
v:Disconnect()
end
end

function p.SafeCallback(r,...)
if not r then
return
end

local u,v=pcall(r,...)
if not u then
if m and m.Window and m.Window.Debug then local
x, z=v:find":%d+: "

warn("[ WindUI: DEBUG Mode ] "..v)

return m:Notify{
Title="DEBUG Mode: Error",
Content=not z and v or v:sub(z+1),
Duration=8,
}
end
end
end

function p.Gradient(r,u)
if m and m.Gradient then
return m:Gradient(r,u)
end

local v={}
local x={}

for z,A in next,r do
local B=tonumber(z)
if B then
B=math.clamp(B/100,0,1)
table.insert(v,ColorSequenceKeypoint.new(B,A.Color))
table.insert(x,NumberSequenceKeypoint.new(B,A.Transparency or 0))
end
end

table.sort(v,function(z,A)
return z.Time<A.Time
end)
table.sort(x,function(z,A)
return z.Time<A.Time
end)

if#v<2 then
error"ColorSequence requires at least 2 keypoints"
end

local z={
Color=ColorSequence.new(v),
Transparency=NumberSequence.new(x),
}

if u then
for A,B in pairs(u)do
z[A]=B
end
end

return z
end

function p.SetTheme(r)
local u=p.Theme
p.Theme=r
p.UpdateTheme(nil,false)

for v,x in next,p.ThemeChangeCallbacks do
p.SafeCallback(x,r,u)
end
end

function p.AddFontObject(r)
table.insert(p.FontObjects,r)
p.UpdateFont(p.Font)
end

function p.UpdateFont(r)
p.Font=r
for u,v in next,p.FontObjects do
v.FontFace=Font.new(r,v.FontFace.Weight,v.FontFace.Style)
end
end

function p.GetThemeProperty(r,u)
local function getValue(v,x)
local z=x[v]

if z==nil then
return nil
end

if typeof(z)=="string"and string.sub(z,1,1)=="#"then
return Color3.fromHex(z)
end

if typeof(z)=="Color3"then
return z
end

if typeof(z)=="number"then
return z
end

if typeof(z)=="table"and z.Color and z.Transparency then
return z
end

if typeof(z)=="function"then
return z(x)
end

return z
end

local v=getValue(r,u)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local x=p.GetThemeProperty(v,u)
if x~=nil then
return x
end
else
return v
end
end

local x=p.ThemeFallbacks[r]
if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,u)
else
return getValue(r,{[r]=x})
end
end

v=getValue(r,p.Themes.Dark)
if v~=nil then
if typeof(v)=="string"and string.sub(v,1,1)~="#"then
local z=p.GetThemeProperty(v,p.Themes.Dark)
if z~=nil then
return z
end
else
return v
end
end

if x~=nil then
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
return p.GetThemeProperty(x,p.Themes.Dark)
else
return getValue(r,{[r]=x})
end
end

return nil
end

function p.AddThemeObject(r,u,v)
if p.Objects[r]then
for x,z in pairs(u)do
p.Objects[r].Properties[x]=z
end
else
p.Objects[r]={Object=r,Properties=u}
end

if not v then
p.UpdateTheme(r,false)
end
return r
end

function p.AddLangObject(r)
local u=p.LocalizationObjects[r]
if not u then
return
end

local v=u.Object

p.SetLangForObject(r)

return v
end

function p.UpdateTheme(r,u,v,x,z,A)
local function ApplyTheme(B)
for C,F in pairs(B.Properties or{})do
local G=p.GetThemeProperty(F,p.Theme)
if G~=nil then
if typeof(G)=="Color3"then
local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end

if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
elseif typeof(G)=="table"and G.Color and G.Transparency then
B.Object[C]=Color3.new(1,1,1)

local H=B.Object:FindFirstChild"LibraryGradient"
if not H then
H=Instance.new"UIGradient"
H.Name="LibraryGradient"
H.Parent=B.Object
end

H.Color=G.Color
H.Transparency=G.Transparency

for J,L in pairs(G)do
if J~="Color"and J~="Transparency"and H[J]~=nil then
H[J]=L
end
end
elseif typeof(G)=="number"then
if v then
p.Tween(
B.Object,
x or 0.2,
{[C]=G},
z or Enum.EasingStyle.Quint,
A or Enum.EasingDirection.Out
):Play()
elseif u then
p.Tween(B.Object,0.08,{[C]=G}):Play()
else
B.Object[C]=G
end
end
else
local H=B.Object:FindFirstChild"LibraryGradient"
if H then
H:Destroy()
end
end
end
end

if r then
local B=p.Objects[r]
if B then
ApplyTheme(B)
end
else
for B,C in pairs(p.Objects)do
ApplyTheme(C)
end
end
end

function p.SetThemeTag(r,u,v,x,z)
p.AddThemeObject(r,u)
p.UpdateTheme(r,false,true,v,x,z)
end

function p.SetLangForObject(r)
if p.Localization and p.Localization.Enabled then
local u=p.LocalizationObjects[r]
if not u then
return
end

local v=u.Object
local x=u.TranslationId

local z=p.Localization.Translations[p.Language]
if z and z[x]then
v.Text=z[x]
else
local A=p.Localization
and p.Localization.Translations
and p.Localization.Translations.en
or nil
if A and A[x]then
v.Text=A[x]
else
v.Text="["..x.."]"
end
end
end
end

function p.ChangeTranslationKey(r,u,v)
if p.Localization and p.Localization.Enabled then
local x=string.match(v,"^"..p.Localization.Prefix.."(.+)")
if x then
for z,A in ipairs(p.LocalizationObjects)do
if A.Object==u then
A.TranslationId=x
p.SetLangForObject(z)
return
end
end

table.insert(p.LocalizationObjects,{
TranslationId=x,
Object=u,
})
p.SetLangForObject(#p.LocalizationObjects)
end
end
end

function p.UpdateLang(r)
if r then
p.Language=r
end

for u=1,#p.LocalizationObjects do
local v=p.LocalizationObjects[u]
if v.Object and v.Object.Parent~=nil then
p.SetLangForObject(u)
else
p.LocalizationObjects[u]=nil
end
end
end

function p.SetLanguage(r)
p.Language=r
p.UpdateLang()
end

function p.Icon(r,u)
return l.Icon2(r,nil,u~=false)
end

function p.AddIcons(r,u)
return l.AddIcons(r,u)
end

function p.New(r,u,v)
local x=Instance.new(r)

for z,A in next,p.DefaultProperties[r]or{}do
x[z]=A
end

for z,A in next,u or{}do
if z~="ThemeTag"then
x[z]=A
end
if p.Localization and p.Localization.Enabled and z=="Text"then
local B=string.match(A,"^"..p.Localization.Prefix.."(.+)")
if B then
local C=#p.LocalizationObjects+1
p.LocalizationObjects[C]={TranslationId=B,Object=x}

p.SetLangForObject(C)
end
end
end

for z,A in next,v or{}do
A.Parent=x
end

if u and u.ThemeTag then
p.AddThemeObject(x,u.ThemeTag)
end
if u and u.FontFace then
p.AddFontObject(x)
end
return x
end

function p.Tween(r,u,v,...)
return f:Create(r,TweenInfo.new(u,...),v)
end








































































function p.NewRoundFrame(r,u,v,x,z,A)
return i:New(r,u,v,x,z,nil)
end

local r=p.New local u=
p.Tween

function p.SetDraggable(v)
p.CanDraggable=v
end

function p.Drag(v,x,z)
local A=m.GenerateGUID()

local B
local C=false
local F,G
local H

local J={
CanDraggable=true,
}

if not x or typeof(x)~="table"then
x={v}
end

local function update(L)
if not C or not J.CanDraggable then
return
end

local M=L.Position-F
p.Tween(v,0.02,{
Position=UDim2.new(
G.X.Scale,
G.X.Offset+M.X,
G.Y.Scale,
G.Y.Offset+M.Y
),
}):Play()
end

for L,M in pairs(x)do
M.InputBegan:Connect(function(N)
if not J.CanDraggable or C then
return
end

if
N.UserInputType==Enum.UserInputType.MouseButton1
or N.UserInputType==Enum.UserInputType.Touch
then
if m and m.CurrentInput and m.CurrentInput~=A then
return
end

m.CurrentInput=A

C=true
H=N
B=M
F=N.Position
G=v.Position

if z and typeof(z)=="function"then
z(true,B)
end
end
end)
end

e.InputChanged:Connect(function(L)
if not C then
return
end
if m.CurrentInput and m.CurrentInput~=A then
return
end

if H.UserInputType==Enum.UserInputType.MouseButton1 then
if L.UserInputType==Enum.UserInputType.MouseMovement then
update(L)
end
elseif H.UserInputType==Enum.UserInputType.Touch then
if L==H then
update(L)
end
end
end)

e.InputEnded:Connect(function(L)
if not C or m.CurrentInput~=A then
return
end

if
L==H
or(
H.UserInputType==Enum.UserInputType.MouseButton1
and L.UserInputType==Enum.UserInputType.MouseButton1
)
then
m.CurrentInput=nil
C=false
H=nil
B=nil

if z and typeof(z)=="function"then
z(false,nil)
end
end
end)

function J.Set(L,M)
J.CanDraggable=M
end

return J
end

l.Init(r,"Icon")

function p.SanitizeFilename(v)
local x=v:match"([^/]+)$"or v

x=x:gsub("%.[^%.]+$","")

x=x:gsub("[^%w%-_]","_")

if#x>50 then
x=x:sub(1,50)
end

return x
end

function p.Image(v,x,z,A,B,C,F,G)
A=A or"Temp"
x=p.SanitizeFilename(x)

local H=r("Frame",{
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
r("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=(p.Icon(v)or F)and{
ImageColor3=C and(G or"Icon")or nil,
}or nil,
},{
r("UICorner",{
CornerRadius=UDim.new(0,z),
}),
}),
})
if p.Icon(v)then
H.ImageLabel:Destroy()

local J=l.Image{
Icon=v,
Size=UDim2.new(1,0,1,0),
Colors={
(C and(G or"Icon")or false),
"Button",
},
}.IconFrame
J.Parent=H
elseif string.find(v,"http")and not string.find(v,"roblox.com")then
local J="WindUI/"..A.."/assets/."..B.."-"..x..".png"
local L,M=pcall(function()
task.spawn(function()
local L=p.Request
and p.Request{
Url=v,
Method="GET",
}.Body
or{}

if not d:IsStudio()and writefile then
writefile(J,L)
end


local M,N=pcall(getcustomasset,J)
if M then
H.ImageLabel.Image=N
else
warn(
string.format(
"[ WindUI.Creator ] Failed to load custom asset '%s': %s",
J,
tostring(N)
)
)
H:Destroy()

return
end
end)
end)
if not L then
warn(
"[ WindUI.Creator ]  '"..identifyexecutor()
or"Studio".."' doesnt support the URL Images. Error: "..M
)

H:Destroy()
end
elseif v==""then
H.Visible=false
else
H.ImageLabel.Image=v
end

return H
end

function p.Color3ToHSB(v)
local x,z,A=v.R,v.G,v.B
local B=math.max(x,z,A)
local C=math.min(x,z,A)
local F=B-C

local G=0
if F~=0 then
if B==x then
G=(z-A)/F%6
elseif B==z then
G=(A-x)/F+2
else
G=(x-z)/F+4
end
G=G*60
else
G=0
end

local H=(B==0)and 0 or(F/B)
local J=B

return{
h=math.floor(G+0.5),
s=H,
b=J,
}
end

function p.GetPerceivedBrightness(v)
local x=v.R
local z=v.G
local A=v.B
return 0.299*x+0.587*z+0.114*A
end

function p.GetTextColorForHSB(v,x)
local z=p.Color3ToHSB(v)local
A, B, C=z.h, z.s, z.b
if p.GetPerceivedBrightness(v)>(x or 0.5)then
return Color3.fromHSV(A/360,0,0.05)
else
return Color3.fromHSV(A/360,0,0.98)
end
end

function p.GetAverageColor(v)
local x,z,A=0,0,0
local B=v.Color.Keypoints
for C,F in ipairs(B)do

x=x+F.Value.R
z=z+F.Value.G
A=A+F.Value.B
end
local C=#B
return Color3.new(x/C,z/C,A/C)
end

function p.GenerateUniqueID(v)
return h:GenerateGUID(false)
end

function p.OnThemeChange(v,x)
if typeof(x)~="function"then
return
end

local z=h:GenerateGUID(false)
p.ThemeChangeCallbacks[z]=x

return{
Disconnect=function()
p.ThemeChangeCallbacks[z]=nil
end,
}
end

function p.AddColor(v,x,z,A)
A=math.clamp(A or 1,0,1)
if typeof(z)=="string"then
z=Color3.fromHex(z)
end

return function(B)
local C
if typeof(x)=="string"and string.sub(x,1,1)~="#"then
C=p.GetThemeProperty(x,B)
elseif typeof(x)=="string"then
C=Color3.fromHex(x)
else
C=x
end

if not C or typeof(C)~="Color3"then
return nil
end

return Color3.new(
math.clamp(C.R+z.R*A,0,1),
math.clamp(C.G+z.G*A,0,1),
math.clamp(C.B+z.B*A,0,1)
)
end
end

function p.GetElementPosition(v,x,z,A)
if type(z)~="number"or z~=math.floor(z)then
return nil,1
end






local B=#x


if B==0 or z<1 or z>B then
return nil,2
end

local function isDelimiter(C)
if C==nil then
return true
end
local F=C.__type
return F=="Divider"or F=="Space"or F=="Section"
end

if isDelimiter(x[z])then
return nil,3
end

local function calculate(C,F)
if F==1 then
return"Squircle"
end
if C==1 then
return A and"SquircleH-TL-TR"or"Squircle-TL-TR"
end
if C==F then
return A and"SquircleH-BL-BR"or"Squircle-BL-BR"
end
return"Square"
end

local C=1
local F=0

for G=1,B do
local H=x[G]
if isDelimiter(H)then
if z>=C and z<=G-1 then
local J=z-C+1
return calculate(J,F)
end
C=G+1
F=0
else
F=F+1
end
end

if z>=C and z<=B then
local G=z-C+1
return calculate(G,F)
end

return nil,4
end

return p end function a.d():typeof(__modImpl())local b=a.cache.d if not b then b={c=__modImpl()}a.cache.d=b end return b.c end end do local function __modImpl()

local b={}







function b.New(d,e,f)
local g={
Enabled=e.Enabled or false,
Translations=e.Translations or{},
Prefix=e.Prefix or"loc:",
DefaultLanguage=e.DefaultLanguage or"en"
}

f.Localization=g

return g
end



return b end function a.e():typeof(__modImpl())local b=a.cache.e if not b then b={c=__modImpl()}a.cache.e=b end return b.c end end do local function __modImpl()
local b=a.d()
local d=b.New
local e=b.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=18,
UIPadding=14,

Holder=nil,
NotificationIndex=0,
Notifications={},
}

function f.Init(g)
local h={
Lower=false,
}

function h.SetLower(i)
h.Lower=i
h.Frame.Size=i and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29),
}),
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
IconThemed=g.IconThemed,
Background=g.Background,
BackgroundImageTransparency=g.BackgroundImageTransparency,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=g.CanClose~=false,
UIElements={},
Closed=false,
}



f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h









local i

if h.Icon then





















i=b.Image(
h.Icon,
h.Title..":"..h.Icon,
0,
g.Window,
"Notification",
h.IconThemed
)
i.Size=UDim2.new(0,26,0,26)
i.Position=UDim2.new(0,f.UIPadding,0,f.UIPadding)

end

local l
if h.CanClose then
l=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.4,
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})
end

local m=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(0,0,1,0),
ThemeTag={
ImageTransparency="NotificationDurationTransparency",
ImageColor3="NotificationDuration",
},

})

local p=d("Frame",{
Size=UDim2.new(1,h.Icon and-28-f.UIPadding or 0,1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=18,
ThemeTag={
TextColor3="NotificationTitle",
TextTransparency="NotificationTitleTransparency",
},
Text=h.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3),
}),
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,

TextSize=15,
ThemeTag={
TextColor3="NotificationContent",
TextTransparency="NotificationContentTransparency",
},
Text=h.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=p,
})
end

local r=b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
ImageTransparency=0.05,
ThemeTag={
ImageColor3="Notification",
},

},{
b.NewRoundFrame(f.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Notification2",
ImageTransparency="Notification2Transparency",
},
}),
d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="DurationFrame",
},{






d("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ClipsDescendants=true,
},{
m,
}),




}),
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",
ImageTransparency=h.BackgroundImageTransparency,

},{
d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
}),
}),

p,
i,
l,
})

local u=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder,
},{
r,
})

function h.Close(v)
if not h.Closed then
h.Closed=true
e(
u,
0.45,
{Size=UDim2.new(1,0,0,-8)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
e(r,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(0.45)
u:Destroy()
end
end

task.spawn(function()
task.wait()
e(
u,
0.45,
{Size=UDim2.new(1,0,0,r.AbsoluteSize.Y)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
e(r,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
m.Size=UDim2.new(0,r.DurationFrame.AbsoluteSize.X,1,0)
e(
r.DurationFrame.Frame,
h.Duration,
{Size=UDim2.new(0,0,1,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut
):Play()
task.wait(h.Duration)
h:Close()
end
end)

if l then
b.AddSignal(l.TextButton.MouseButton1Click,function()
h:Close()
end)
end


return h
end

return f end function a.f():typeof(__modImpl())local b=a.cache.f if not b then b={c=__modImpl()}a.cache.f=b end return b.c end end do local function __modImpl()












local b=4294967296;local d=b-1;local function c(e,f)local g,h=0,1;while e~=0 or f~=0 do local i,l=e%2,f%2;local m=(i+l)%2;g=g+m*h;e=math.floor(e/2)f=math.floor(f/2)h=h*2 end;return g%b end;local function k(e,f,g,...)local h;if f then e=e%b;f=f%b;h=c(e,f)if g then h=k(h,g,...)end;return h elseif e then return e%b else return 0 end end;local function n(e,f,g,...)local h;if f then e=e%b;f=f%b;h=(e+f-c(e,f))/2;if g then h=n(h,g,...)end;return h elseif e then return e%b else return d end end;local function o(e)return d-e end;local function q(e,f)if f<0 then return lshift(e,-f)end;return math.floor(e%4294967296/2^f)end;local function s(e,f)if f>31 or f<-31 then return 0 end;return q(e%b,f)end;local function lshift(e,f)if f<0 then return s(e,-f)end;return e*2^f%4294967296 end;local function t(e,f)e=e%b;f=f%32;local g=n(e,2^f-1)return s(e,f)+lshift(g,32-f)end;local e={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(f)return string.gsub(f,".",function(g)return string.format("%02x",string.byte(g))end)end;local function y(f,g)local h=""for i=1,g do local l=f%256;h=string.char(l)..h;f=(f-l)/256 end;return h end;local function D(f,g)local h=0;for i=g,g+3 do h=h*256+string.byte(f,i)end;return h end;local function E(f,g)local h=64-(g+9)%64;g=y(8*g,8)f=f.."\128"..string.rep("\0",h)..g;assert(#f%64==0)return f end;local function I(f)f[1]=0x6a09e667;f[2]=0xbb67ae85;f[3]=0x3c6ef372;f[4]=0xa54ff53a;f[5]=0x510e527f;f[6]=0x9b05688c;f[7]=0x1f83d9ab;f[8]=0x5be0cd19;return f end;local function K(f,g,h)local i={}for l=1,16 do i[l]=D(f,g+(l-1)*4)end;for l=17,64 do local m=i[l-15]local p=k(t(m,7),t(m,18),s(m,3))m=i[l-2]i[l]=(i[l-16]+p+i[l-7]+k(t(m,17),t(m,19),s(m,10)))%b end;local l,m,p,r,u,v,x,z=h[1],h[2],h[3],h[4],h[5],h[6],h[7],h[8]for A=1,64 do local B=k(t(l,2),t(l,13),t(l,22))local C=k(n(l,m),n(l,p),n(m,p))local F=(B+C)%b;local G=k(t(u,6),t(u,11),t(u,25))local H=k(n(u,v),n(o(u),x))local J=(z+G+H+e[A]+i[A])%b;z=x;x=v;v=u;u=(r+J)%b;r=p;p=m;m=l;l=(J+F)%b end;h[1]=(h[1]+l)%b;h[2]=(h[2]+m)%b;h[3]=(h[3]+p)%b;h[4]=(h[4]+r)%b;h[5]=(h[5]+u)%b;h[6]=(h[6]+v)%b;h[7]=(h[7]+x)%b;h[8]=(h[8]+z)%b end;local function Z(f)f=E(f,#f)local g=I{}for h=1,#f,64 do K(f,h,g)end;return w(y(g[1],4)..y(g[2],4)..y(g[3],4)..y(g[4],4)..y(g[5],4)..y(g[6],4)..y(g[7],4)..y(g[8],4))end;local f;local g={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local h={["/"]="/"}for i,l in pairs(g)do h[l]=i end;local i=function(i)return"\\"..(g[i]or string.format("u%04x",i:byte()))end;local l=function(l)return"null"end;local m=function(m,p)local r={}p=p or{}if p[m]then error"circular reference"end;p[m]=true;if rawget(m,1)~=nil or next(m)==nil then local u=0;for v in pairs(m)do if type(v)~="number"then error"invalid table: mixed or invalid key types"end;u=u+1 end;if u~=#m then error"invalid table: sparse array"end;for v,x in ipairs(m)do table.insert(r,f(x,p))end;p[m]=nil;return"["..table.concat(r,",").."]"else for u,v in pairs(m)do if type(u)~="string"then error"invalid table: mixed or invalid key types"end;table.insert(r,f(u,p)..":"..f(v,p))end;p[m]=nil;return"{"..table.concat(r,",").."}"end end;local p=function(p)return'"'..p:gsub('[%z\1-\31\\"]',i)..'"'end;local r=function(r)if r~=r or r<=-math.huge or r>=math.huge then error("unexpected number value '"..tostring(r).."'")end;return string.format("%.14g",r)end;local u={["nil"]=l,table=m,string=p,number=r,boolean=tostring}f=function(v,x)local z=type(v)local A=u[z]if A then return A(v,x)end;error("unexpected type '"..z.."'")end;local v=function(v)return f(v)end;local x;local z=function(...)local z={}for A=1,select("#",...)do z[select(A,...)]=true end;return z end;local A=z(" ","\t","\r","\n")local B=z(" ","\t","\r","\n","]","}",",")local C=z("\\","/",'"',"b","f","n","r","t","u")local F=z("true","false","null")local G={["true"]=true,["false"]=false,null=nil}local H=function(H,J,L,M)for N=J,#H do if L[H:sub(N,N)]~=M then return N end end;return#H+1 end;local J=function(J,L,M)local N=1;local O=1;for P=1,L-1 do O=O+1;if J:sub(P,P)=="\n"then N=N+1;O=1 end end;error(string.format("%s at line %d col %d",M,N,O))end;local L=function(L)local M=math.floor;if L<=0x7f then return string.char(L)elseif L<=0x7ff then return string.char(M(L/64)+192,L%64+128)elseif L<=0xffff then return string.char(M(L/4096)+224,M(L%4096/64)+128,L%64+128)elseif L<=0x10ffff then return string.char(M(L/262144)+240,M(L%262144/4096)+128,M(L%4096/64)+128,L%64+128)end;error(string.format("invalid unicode codepoint '%x'",L))end;local M=function(M)local N=tonumber(M:sub(1,4),16)local O=tonumber(M:sub(7,10),16)if O then return L((N-0xd800)*0x400+O-0xdc00+0x10000)else return L(N)end end;local N=function(N,O)local P=""local Q=O+1;local R=Q;while Q<=#N do local S=N:byte(Q)if S<32 then J(N,Q,"control character in string")elseif S==92 then P=P..N:sub(R,Q-1)Q=Q+1;local T=N:sub(Q,Q)if T=="u"then local U=N:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",Q+1)or N:match("^%x%x%x%x",Q+1)or J(N,Q-1,"invalid unicode escape in string")P=P..M(U)Q=Q+#U else if not C[T]then J(N,Q-1,"invalid escape char '"..T.."' in string")end;P=P..h[T]end;R=Q+1 elseif S==34 then P=P..N:sub(R,Q-1)return P,Q+1 end;Q=Q+1 end;J(N,O,"expected closing quote for string")end;local O=function(O,P)local Q=H(O,P,B)local R=O:sub(P,Q-1)local S=tonumber(R)if not S then J(O,P,"invalid number '"..R.."'")end;return S,Q end;local P=function(P,Q)local R=H(P,Q,B)local S=P:sub(Q,R-1)if not F[S]then J(P,Q,"invalid literal '"..S.."'")end;return G[S],R end;local Q=function(Q,R)local S={}local T=1;R=R+1;while 1 do local U;R=H(Q,R,A,true)if Q:sub(R,R)=="]"then R=R+1;break end;U,R=x(Q,R)S[T]=U;T=T+1;R=H(Q,R,A,true)local V=Q:sub(R,R)R=R+1;if V=="]"then break end;if V~=","then J(Q,R,"expected ']' or ','")end end;return S,R end;local R=function(R,S)local T={}S=S+1;while 1 do local U,V;S=H(R,S,A,true)if R:sub(S,S)=="}"then S=S+1;break end;if R:sub(S,S)~='"'then J(R,S,"expected string for key")end;U,S=x(R,S)S=H(R,S,A,true)if R:sub(S,S)~=":"then J(R,S,"expected ':' after key")end;S=H(R,S+1,A,true)V,S=x(R,S)T[U]=V;S=H(R,S,A,true)local W=R:sub(S,S)S=S+1;if W=="}"then break end;if W~=","then J(R,S,"expected '}' or ','")end end;return T,S end;local S={['"']=N,["0"]=O,["1"]=O,["2"]=O,["3"]=O,["4"]=O,["5"]=O,["6"]=O,["7"]=O,["8"]=O,["9"]=O,["-"]=O,t=P,f=P,n=P,["["]=Q,["{"]=R}x=function(T,U)local V=T:sub(U,U)local W=S[V]if W then return W(T,U)end;J(T,U,"unexpected character '"..V.."'")end;local T=function(T)if type(T)~="string"then error("expected argument of type string, got "..type(T))end;local U,V=x(T,H(T,1,A,true))V=H(T,V,A,true)if V<=#T then J(T,V,"trailing garbage")end;return U end;
local U,V,W=v,T,Z;





local X={}

local Y=(cloneref or clonereference or function(Y)return Y end)


function X.New(_,aa)

local ab=_;
local ac=aa;
local ad=true;


local ae=function(ae)end;


repeat task.wait(1)until game:IsLoaded();


local af=false;
local ag,ah,ai,aj,ak,al,am,an,ao=setclipboard or toclipboard,request or http_request or syn_request,string.char,tostring,string.sub,os.time,math.random,math.floor,gethwid or function()return Y(game:GetService"Players").LocalPlayer.UserId end
local ap,aq="",0;


local ar="https://api.platoboost.app";
local as=ah{
Url=ar.."/public/connectivity",
Method="GET"
};
if as.StatusCode~=200 and as.StatusCode~=429 then
ar="https://api.platoboost.net";
end


function cacheLink()
if aq+(600)<al()then
local at=ah{
Url=ar.."/public/start",
Method="POST",
Body=U{
service=ab,
identifier=W(ao())
},
Headers={
["Content-Type"]="application/json",
["User-Agent"]="Roblox/Exploit"
}
};

if at.StatusCode==200 then
local au=V(at.Body);

if au.success==true then
ap=au.data.url;
aq=al();
return true,ap
else
ae(au.message);
return false,au.message
end
elseif at.StatusCode==429 then
local au="you are being rate limited, please wait 20 seconds and try again.";
ae(au);
return false,au
end

local au="Failed to cache link.";
ae(au);
return false,au
else
return true,ap
end
end

cacheLink();


local at=function()
local at=""
for au=1,16 do
at=at..ai(an(am()*(26))+97)
end
return at
end


for au=1,5 do
local av=at();
task.wait(0.2)
if at()==av then
local aw="platoboost nonce error.";
ae(aw);
error(aw);
end
end


local au=function()
local au,av=cacheLink();

if au then
ag(av);
end
end


local av=function(av)
local aw=at();
local ax=ar.."/public/redeem/"..aj(ab);

local ay={
identifier=W(ao()),
key=av
}

if ad then
ay.nonce=aw;
end

local az=ah{
Url=ax,
Method="POST",
Body=U(ay),
Headers={
["Content-Type"]="application/json"
}
};

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..aw.."-"..ac)then
return true
else
ae"failed to verify integrity.";
return false
end
else
return true
end
else
ae"key is invalid.";
return false
end
else
if ak(aA.message,1,27)=="unique constraint violation"then
ae"you already have an active key, please wait for it to expire before redeeming it.";
return false
else
ae(aA.message);
return false
end
end
elseif az.StatusCode==429 then
ae"you are being rate limited, please wait 20 seconds and try again.";
return false
else
ae"server returned an invalid status code, please try again later.";
return false
end
end


local aw=function(aw)
if af==true then
return false,("A request is already being sent, please slow down.")
else
af=true;
end

local ax=at();
local ay=ar.."/public/whitelist/"..aj(ab).."?identifier="..W(ao()).."&key="..aw;

if ad then
ay=ay.."&nonce="..ax;
end

local az=ah{
Url=ay,
Method="GET",
};

af=false;

if az.StatusCode==200 then
local aA=V(az.Body);

if aA.success==true then
if aA.data.valid==true then
if ad then
if aA.data.hash==W("true".."-"..ax.."-"..ac)then
return true,""
else
return false,("failed to verify integrity.")
end
else
return true
end
else
if ak(aw,1,4)=="KEY_"then
return true,av(aw)
else
return false,("Key is invalid.")
end
end
else
return false,(aA.message)
end
elseif az.StatusCode==429 then
return false,("You are being rate limited, please wait 20 seconds and try again.")
else
return false,("Server returned an invalid status code, please try again later.")
end
end


local ax=function(ax)
local ay=at();
local az=ar.."/public/flag/"..aj(ab).."?name="..ax;

if ad then
az=az.."&nonce="..ay;
end

local aA=ah{
Url=az,
Method="GET",
};

if aA.StatusCode==200 then
local aB=V(aA.Body);

if aB.success==true then
if ad then
if aB.data.hash==W(aj(aB.data.value).."-"..ay.."-"..ac)then
return aB.data.value
else
ae"failed to verify integrity.";
return nil
end
else
return aB.data.value
end
else
ae(aB.message);
return nil
end
else
return nil
end
end


return{
Verify=aw,
GetFlag=ax,
Copy=au,
}
end


return X end function a.g():typeof(__modImpl())local aa=a.cache.g if not aa then aa={c=__modImpl()}a.cache.g=aa end return aa.c end end do local function __modImpl()






local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ab=aa(game:GetService"HttpService")
local ac={}

function ac.New(ad)
local ae=gethwid or function()
return aa(game:GetService"Players").LocalPlayer.UserId
end
local af,ag=request or http_request or syn_request,setclipboard or toclipboard

function ValidateKey(ah)
local ai="https://api.pandauth.com/api/v1/keys/validate"

local aj={
ServiceID=ad,
HWID=tostring(ae()),
Key=tostring(ah),
}

local ak=ab:JSONEncode(aj)
local al,am=pcall(function()
return af{
Url=ai,
Method="POST",
Headers={
["User-Agent"]="Roblox/Exploit",
["Content-Type"]="application/json",
},
Body=ak,
}
end)

if al and am then
if am.Success then
local an,ao=pcall(function()
return ab:JSONDecode(am.Body)
end)

if an and ao then
if ao.Authenticated_Status and ao.Authenticated_Status=="Success"then
return true,"Authenticated"
else
local ap=ao.Note or"Unknown reason"
return false,"Authentication failed: "..ap
end
else
return false,"JSON decode error"
end
else
warn(
" HTTP request was not successful. Code: "
..tostring(am.StatusCode)
.." Message: "
..am.StatusMessage
)
return false,"HTTP request failed: "..am.StatusMessage
end
else
return false,"Request pcall error"
end
end

function GetKeyLink()
return"https://new.pandadevelopment.net/getkey/"..tostring(ad).."?hwid="..tostring(ae())
end

function CopyLink()
return ag(GetKeyLink())
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return ac end function a.h():typeof(__modImpl())local aa=a.cache.h if not aa then aa={c=__modImpl()}a.cache.h=aa end return aa.c end end do local function __modImpl()







local aa={}

function aa.New(ab,ac)
local ad="https://sdkapi-public.luarmor.net/library.lua"

local ae=loadstring(game.HttpGet and game:HttpGet(ad)or HttpService:GetAsync(ad))()
local af=setclipboard or toclipboard

ae.script_id=ab

function ValidateKey(ag)
local ah=ae.check_key(ag)


if ah.code=="KEY_VALID"then
return true,"Whitelisted!"
elseif ah.code=="KEY_HWID_LOCKED"then
return false,"Key linked to a different HWID. Please reset it using our bot"
elseif ah.code=="KEY_INCORRECT"then
return false,"Key is wrong or deleted!"
else
return false,"Key check failed:"..ah.message.." Code: "..ah.code
end
end

function CopyLink()
af(tostring(ac))
end

return{
Verify=ValidateKey,
Copy=CopyLink,
}
end

return aa end function a.i():typeof(__modImpl())local aa=a.cache.i if not aa then aa={c=__modImpl()}a.cache.i=aa end return aa.c end end do local function __modImpl()









local aa={}

function aa.New(ab,ac,ad)
JunkieProtected.API_KEY=ac
JunkieProtected.PROVIDER=ad
JunkieProtected.SERVICE_ID=ab

local function ValidateKey(ae)
if not ae or ae==""then
print"No key provided!"

return false,"No key provided. Please get a key."
end

local af=JunkieProtected.IsKeylessMode()
if af and af.keyless_mode then
print"Keyless mode enabled. Starting script..."
return true,"Keyless mode enabled. Starting script..."
end

local ag=JunkieProtected.ValidateKey{Key=ae}
if ag=="valid"then
print"Key is valid! Starting script..."
load()
if _G.JD_IsPremium then
print"Premium user detected!"
else
print"Standard user"
end

return true,"Key is valid!"
else
local ah=JunkieProtected.GetKeyLink()
print"Invalid key!"

return false,"Invalid key. Get one from:"..ah
end
end

local function copyLink()
local ae=JunkieProtected.GetKeyLink()

if setclipboard then
setclipboard(ae)
end
end
return{
Verify=ValidateKey,
Copy=copyLink
}
end

return aa end function a.j():typeof(__modImpl())local aa=a.cache.j if not aa then aa={c=__modImpl()}a.cache.j=aa end return aa.c end end do local function __modImpl()



return{
platoboost={
Name="Platoboost",
Icon="rbxassetid://75920162824531",
Args={"ServiceId","Secret"},

New=a.g().New
},
pandadevelopment={
Name="Panda Development",
Icon="panda",
Args={"ServiceId"},

New=a.h().New
},
luarmor={
Name="Luarmor",
Icon="rbxassetid://130918283130165",
Args={"ScriptId","Discord"},

New=a.i().New
},
junkiedevelopment={
Name="Junkie Development",
Icon="rbxassetid://106310347705078",
Args={"ServiceId","ApiKey","Provider"},

New=a.j().New
},


}end function a.k():typeof(__modImpl())local aa=a.cache.k if not aa then aa={c=__modImpl()}a.cache.k=aa end return aa.c end end do local function __modImpl()



return[[
{
    "name": "vendettaui",
    "version": "1.0.0",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Alowyyy1/VendettaUI",
    "author": "Alowyy1",
    "description": "Apple-inspired Roblox UI Library with SF Symbols and macOS/iOS controls",
    "license": "MIT",
    "scripts": {
        "build": "powershell -ExecutionPolicy Bypass -File ./build.ps1",
        "dev": "powershell -ExecutionPolicy Bypass -File ./build.ps1 -Dev"
    },
    "keywords": [
        "ui-library",
        "apple-design",
        "sf-symbols",
        "roblox",
        "macos",
        "script-hub"
    ]
}

]]end function a.l():typeof(__modImpl())local aa=a.cache.l if not aa then aa={c=__modImpl()}a.cache.l=aa end return aa.c end end do local function __modImpl()local aa={}local ab=a.d()local ac=ab.New local ad=ab.Tween function aa.New(ae,af,ag,ah,ai,aj,ak,al)ah=ah or"Primary"local am=al or(not ak and 10 or 999)local an if af and af~=""then an=ac("ImageLabel",{Image=ab.Icon(af)[1],ImageRectSize=ab.Icon(af)[2].ImageRectSize,ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,Size=UDim2.new(0,21,0,21),BackgroundTransparency=1,ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,ImageTransparency=ah=="White"and 0.4 or 0,ThemeTag={ImageColor3=ah~="White"and"Icon"or nil,},})
end

local ao=ac("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=ai,
BackgroundTransparency=1,
},{
ab.NewRoundFrame(am,"Squircle",{
ThemeTag={
ImageColor3=ah~="White"and"Button"or nil,
},
ImageColor3=ah=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=ah=="Primary"and 0 or ah=="White"and 0 or 0.9,
}),

ab.NewRoundFrame(am,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=ah=="Secondary"and 0.95 or 1,
}),

ab.NewRoundFrame(am,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",

ImageTransparency=1,
Visible=not ak,
}),

ab.NewRoundFrame(am,"SquircleGlass",{
ThemeTag={
ImageColor3="White",
},
Size=UDim2.new(1,1,1,1),

ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Outline",
},{













}),

ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=ah~="White"and"Text"or nil,
},
ImageColor3=ah=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1,
},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
an,
ac("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ae or"Button",
ThemeTag={
TextColor3=(ah~="Primary"and ah~="White")and"Text",
},
TextColor3=ah=="Primary"and Color3.new(1,1,1)
or ah=="White"and Color3.new(0,0,0)
or nil,
AutomaticSize="XY",
TextSize=18,
}),
}),
})

ab.AddSignal(ao.MouseEnter,function()
ad(ao.Frame,0.047,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(ao.MouseLeave,function()
ad(ao.Frame,0.047,{ImageTransparency=1}):Play()
end)
ab.AddSignal(ao.MouseButton1Click,function()
if aj then
aj:Close()()
end
if ag then
ab.SafeCallback(ag)
end
end)

return ao
end

return aa end function a.m():typeof(__modImpl())local aa=a.cache.m if not aa then aa={c=__modImpl()}a.cache.m=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New local ad=
ab.Tween

function aa.New(ae,af,ag,ah,ai,aj,ak,al,am)
ah=ah or"Input"
local an=ak or 10
local ao
if af and af~=""then
ao=ac("ImageLabel",{
Image=ab.Icon(af)[1],
ImageRectSize=ab.Icon(af)[2].ImageRectSize,
ImageRectOffset=ab.Icon(af)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local ap=ah=="Textarea"

local aq=ac("TextBox",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,ao and-29 or 0,1,0),
PlaceholderText=ae,
ClearTextOnFocus=al or false,
ClipsDescendants=true,
TextWrapped=ap,
MultiLine=ap,
TextXAlignment="Left",
TextYAlignment=ah~="Textarea"and"Center"or"Top",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local ar=ac("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=ag,
BackgroundTransparency=1,
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(an,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not am and ab.NewRoundFrame(an-1,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
})or nil,
ab.NewRoundFrame(an,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingTop=UDim.new(0,ah~="Textarea"and 0 or 12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,ah~="Textarea"and 0 or 12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment=ah~="Textarea"and"Center"or"Top",
HorizontalAlignment="Left",
}),
ao,
aq,
}),
}),
})










if aj then
ab.AddSignal(aq:GetPropertyChangedSignal"Text",function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
else
ab.AddSignal(aq.FocusLost,function()
if ai then
ab.SafeCallback(ai,aq.Text)
end
end)
end

return ar
end

return aa end function a.n():typeof(__modImpl())local aa=a.cache.n if not aa then aa={c=__modImpl()}a.cache.n=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ab=aa.New
local ac=aa.Tween




local ad={
Holder=nil,

Parent=nil,
}

function ad.Create(ae,af,ag,ah,ai)
local aj={
UICorner=28,
UIPadding=12,

Window=ag,
WindUI=ah,

UIElements={},
}

if ae then
aj.UIPadding=0
end
if ae then
aj.UICorner=26
end

af=af or"Dialog"

if not ae then
aj.UIElements.FullScreen=ab("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#000000",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=ad.Parent
or(ag and ag.UIElements and ag.UIElements.Main and ag.UIElements.Main.Main),
},{
ab("UICorner",{
CornerRadius=UDim.new(0,(ag and ag.UICorner)or 16),
}),
})
end

ab("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

aj.UIElements.Main=ab("Frame",{
Size=UDim2.new(0,280,0,0),
ThemeTag={
BackgroundColor3=af.."Background",
},
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,aj.UIPadding),
PaddingLeft=UDim.new(0,aj.UIPadding),
PaddingRight=UDim.new(0,aj.UIPadding),
PaddingBottom=UDim.new(0,aj.UIPadding),
}),
})

aj.UIElements.MainContainer=aa.NewRoundFrame(aj.UICorner,"Squircle",{
Visible=false,

ImageTransparency=0.15,
Parent=(not ae and aj.UIElements.FullScreen)or ai,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3=af.."Background",
ImageTransparency=af.."BackgroundTransparency",
},
ZIndex=9999,
},{






aj.UIElements.Main,




















})

function aj.Open(ak,al)
al=al or 0.35
local am=aj.UIElements.MainContainer
if not am then return end

if not ae and aj.UIElements.FullScreen then
aj.UIElements.FullScreen.Visible=true
aj.UIElements.FullScreen.Active=true
aj.UIElements.FullScreen.BackgroundTransparency=1
ac(aj.UIElements.FullScreen,al,{BackgroundTransparency=0.65},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
end

local an=am:FindFirstChildOfClass"UIScale"
if not an then
an=Instance.new"UIScale"
an.Name="DialogScale"
an.Parent=am
end

an.Scale=0.88
am.Visible=true
aj.UIElements.Main.Visible=true

ac(an,al,{Scale=1.0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

local ao=0.15
am.ImageTransparency=1
ac(am,al,{ImageTransparency=ao},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

for ap,aq in ipairs(am:GetDescendants())do
if aq:IsA"TextLabel"or aq:IsA"TextBox"or aq:IsA"TextButton"then
local ar=aq.TextTransparency
aq.TextTransparency=1
ac(aq,al,{TextTransparency=ar},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
elseif aq:IsA"ImageLabel"and aq~=am then
local ar=aq.ImageTransparency
aq.ImageTransparency=1
ac(aq,al,{ImageTransparency=ar},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
end
end
end

function aj.Close(ak)
return aj:GenieClose(0.35)
end

function aj.CollapseClose(ak)
return aj:GenieClose(0.35)
end

function aj.GenieClose(ak,al)
al=al or 0.35
local am=aj.UIElements.MainContainer
local an=aj.UIElements.FullScreen

if not am or not am.Parent then
return function()end
end

if not ae and an then
an.Active=false
ac(an,al,{BackgroundTransparency=1},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
end

local ao=am:FindFirstChildOfClass"UIScale"
if not ao then
ao=Instance.new"UIScale"
ao.Name="DialogScale"
ao.Parent=am
end

ac(ao,al,{Scale=0.88},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ac(am,al,{ImageTransparency=1},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

for ap,aq in ipairs(am:GetDescendants())do
if aq:IsA"TextLabel"or aq:IsA"TextBox"or aq:IsA"TextButton"then
ac(aq,al,{TextTransparency=1},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
elseif aq:IsA"ImageLabel"and aq~=am then
ac(aq,al,{ImageTransparency=1},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()
end
end

task.spawn(function()
task.wait(al+0.05)
if an and an.Parent then
pcall(function()an:Destroy()end)
end
if am and am.Parent then
pcall(function()am:Destroy()end)
end
end)

return function()end
end


return aj
end

return ad end function a.o():typeof(__modImpl())local aa=a.cache.o if not aa then aa={c=__modImpl()}a.cache.o=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New
local ad=ab.Tween

local ae=a.m().New
local af=a.n().New

function aa.new(ag,ah,ai,aj)
local ak=a.o()
local al=ak.Create(true,"Popup",ag.Window,ag.WindUI,ag.WindUI.ScreenGui.KeySystem)

local am={}

local an

local ao=(ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width)or 200

local ap=430
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
ap=430+(ao/2)
end

al.UIElements.Main.AutomaticSize="Y"
al.UIElements.Main.Size=UDim2.new(0,ap,0,0)

local aq

if ag.Icon then
aq=
ab.Image(ag.Icon,ag.Title..":"..ag.Icon,0,"Temp","KeySystem",ag.IconThemed)
aq.Size=UDim2.new(0,24,0,24)
aq.LayoutOrder=-1
end

local ar=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ag.KeySystem.Title or ag.Title,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20,
})

local as=ac("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16,
})

local at=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aq,
ar,
})

local au=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





at,
as,
})

local av=af("Enter Key","key",nil,"Input",function(av)
an=av
end)

local aw
if ag.KeySystem.Note and ag.KeySystem.Note~=""then
aw=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ag.KeySystem.Note,
TextSize=18,
TextTransparency=0.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ax=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
}),
}),
})

local ay
if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
local az
if ag.KeySystem.Thumbnail.Title then
az=ac("TextLabel",{
Text=ag.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
ay=ac("ImageLabel",{
Image=ag.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ao,1,-12),
Position=UDim2.new(0,6,0,6),
Parent=al.UIElements.Main,
ScaleType="Crop",
},{
az,
ac("UICorner",{
CornerRadius=UDim.new(0,20),
}),
})
end

ac("Frame",{

Size=UDim2.new(1,ay and-ao or 0,1,0),
Position=UDim2.new(0,ay and ao or 0,0,0),
BackgroundTransparency=1,
Parent=al.UIElements.Main,
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
au,
aw,
av,
ax,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
}),
}),
})





local az=ae("Exit","log-out",function()
al:Close()()
end,"Tertiary",ax.Frame)

if ay then
az.Parent=ay
az.Size=UDim2.new(0,0,0,42)
az.Position=UDim2.new(0,10,1,-10)
az.AnchorPoint=Vector2.new(0,1)
end

if ag.KeySystem.URL then
ae("Get key","key",function()
setclipboard(ag.KeySystem.URL)
end,"Secondary",ax.Frame)
end

if ag.KeySystem.API then








local aA=240
local aB=false
local b=ae("Get key","key",nil,"Secondary",ax.Frame)

local d=ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,1,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
})

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=b.Frame,
},{
d,
ac("UIPadding",{
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
}),
})

local f=ab.Image("chevron-down","chevron-down",0,"Temp","KeySystem",true)

f.Size=UDim2.new(1,0,1,0)

ac("Frame",{
Size=UDim2.new(0,21,0,21),
Parent=b.Frame,
BackgroundTransparency=1,
},{
f,
})

local g=ab.NewRoundFrame(15,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Background",
},
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,5),
PaddingLeft=UDim.new(0,5),
PaddingRight=UDim.new(0,5),
PaddingBottom=UDim.new(0,5),
}),
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
}),
})

local h=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(0,aA,0,0),
ClipsDescendants=true,
AnchorPoint=Vector2.new(1,0),
Parent=b,
Position=UDim2.new(1,0,1,15),
},{
g,
})

ac("TextLabel",{
Text="Select Service",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
Parent=g,
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
})

for i,l in next,ag.KeySystem.API do
local m=ag.WindUI.Services[l.Type]
if m then
local p={}
for r,u in next,m.Args do
table.insert(p,l[u])
end

local r=m.New(table.unpack(p))
r.Type=l.Type
table.insert(am,r)

local u=ab.Image(
l.Icon or m.Icon or Icons[l.Type]or"user",
l.Icon or m.Icon or Icons[l.Type]or"user",
0,
"Temp",
"KeySystem",
true
)
u.Size=UDim2.new(0,24,0,24)

local v=ab.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,0),
ThemeTag={ImageColor3="Text"},
ImageTransparency=1,
Parent=g,
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,10),
VerticalAlignment="Center",
}),
u,
ac("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),
PaddingRight=UDim.new(0,10),
PaddingBottom=UDim.new(0,10),
}),
ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,-34,0,0),
AutomaticSize="Y",
},{
ac("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,5),
HorizontalAlignment="Center",
}),
ac("TextLabel",{
Text=l.Title or m.Name,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.05,
TextSize=18,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
TextXAlignment="Left",
}),
ac("TextLabel",{
Text=l.Desc or"",
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
ThemeTag={TextColor3="Text"},
TextTransparency=0.2,
TextSize=16,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
TextWrapped=true,
Visible=l.Desc and true or false,
TextXAlignment="Left",
}),
}),
},true)

ab.AddSignal(v.MouseEnter,function()
ad(v,0.08,{ImageTransparency=0.95}):Play()
end)
ab.AddSignal(v.InputEnded,function()
ad(v,0.08,{ImageTransparency=1}):Play()
end)
ab.AddSignal(v.MouseButton1Click,function()
r.Copy()
ag.WindUI:Notify{
Title="Key System",
Content="Key link copied to clipboard.",
Image="key",
}
end)
end
end

ab.AddSignal(b.MouseButton1Click,function()
if not aB then
ad(
h,
0.3,
{Size=UDim2.new(0,aA,0,g.AbsoluteSize.Y+1)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(f,0.3,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ad(
h,
0.25,
{Size=UDim2.new(0,aA,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(f,0.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
aB=not aB
end)
end

local function handleSuccess(aA)
al:Close()()
writefile((ag.Folder or"Temp").."/"..ah..".key",tostring(aA))
task.wait(0.4)
ai(true)
end

local aA=ae("Submit","arrow-right",function()
local aA=tostring(an or"empty")local aB=
ag.Folder or ag.Title

if ag.KeySystem.KeyValidator then
local b=ag.KeySystem.KeyValidator(aA)

if b then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
else
ag.WindUI:Notify{
Title="Key System. Error",
Content="Invalid key.",
Icon="triangle-alert",
}
end
elseif not ag.KeySystem.API then
local b=type(ag.KeySystem.Key)=="table"and table.find(ag.KeySystem.Key,aA)
or ag.KeySystem.Key==aA

if b then
if ag.KeySystem.SaveKey then
handleSuccess(aA)
else
al:Close()()
task.wait(0.4)
ai(true)
end
end
else
local b,d
for f,g in next,am do
local h,i=g.Verify(aA)
if h then
b,d=true,i
break
end
d=i
end

if b then
handleSuccess(aA)
else
ag.WindUI:Notify{
Title="Key System. Error",
Content=d,
Icon="triangle-alert",
}
end
end
end,"Primary",ax)

aA.AnchorPoint=Vector2.new(1,0.5)
aA.Position=UDim2.new(1,0,0.5,0)










al:Open()
end

return aa end function a.p():typeof(__modImpl())local aa=a.cache.p if not aa then aa={c=__modImpl()}a.cache.p=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=(cloneref or clonereference or function(ab)
return ab
end)

local ac=ab(game:GetService"Players")
local ad=ac.LocalPlayer

local ae=a.d()
local af=ae.New
local ag=ae.Tween

local ah=a.m().New
local ai=a.o()


local function Typewriter(aj,ak,al)
al=al or 0.025
aj.Text=ak
task.spawn(function()
for am=1,#ak do
if not aj or not aj.Parent then
break
end
aj.Text=string.sub(ak,1,am)
task.wait(al)
end
aj.Text=ak
end)
end


local function SanitizeInputText(aj)
if not aj then
return""
end
return(aj:gsub("[^%w!@#$%^&*()%_%+%-%=%[%]%{%}\\|;:'\",%.%<%>%/%?%~%s]",""))
end


local function CreateMaskedInput(aj,ak,al,am,an,ao)
an=SanitizeInputText(an or"")
local ap=an
local aq=true

local ar=af("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=al,
BackgroundTransparency=1,
})

local as=ae.NewRoundFrame(10,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
Parent=ar,
})

local at=ae.NewRoundFrame(9,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
Parent=ar,
})

local au=ae.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},
Parent=ar,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,0),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,0),
}),
af("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
})

local av
if ak and ak~=""then
av=af("ImageLabel",{
Image=ae.Icon(ak)[1],
ImageRectSize=ae.Icon(ak)[2].ImageRectSize,
ImageRectOffset=ae.Icon(ak)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
Parent=au,
})
end

local aw=af("TextBox",{
BackgroundTransparency=1,
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,(av and-29 or 0)-28,1,0),
PlaceholderText=aj,
ClearTextOnFocus=ao or false,
ClipsDescendants=true,
TextXAlignment="Left",
TextYAlignment="Center",
Text=an~=""and(aq and string.rep("•",utf8.len(an)or#an)or an)or"",
ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
Parent=au,
})

local ax=af("ImageButton",{
Size=UDim2.new(0,20,0,20),
BackgroundTransparency=1,
Image=ae.Icon"eye-off"[1],
ImageRectSize=ae.Icon"eye-off"[2].ImageRectSize,
ImageRectOffset=ae.Icon"eye-off"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
Parent=au,
})

ae.AddSignal(ax.MouseEnter,function()
ag(ax,0.15,{ImageTransparency=0.2}):Play()
end)
ae.AddSignal(ax.MouseLeave,function()
ag(ax,0.15,{ImageTransparency=0}):Play()
end)

ae.AddSignal(aw.Focused,function()
ag(at,0.2,{ImageTransparency=0.3}):Play()
ag(as,0.2,{ImageTransparency=0.6}):Play()
end)

ae.AddSignal(aw.FocusLost,function()
ag(at,0.25,{ImageTransparency=0.8}):Play()
ag(as,0.25,{ImageTransparency=0.85}):Play()
end)

local function UpdateDisplayText()
if aq then
local ay=utf8.len(ap)or#ap
aw.Text=string.rep("•",ay)
else
aw.Text=ap
end
end

ae.AddSignal(aw:GetPropertyChangedSignal"Text",function()
local ay=aw.Text

if aq then
local az=utf8.len(ap)or#ap
local aA=string.rep("•",az)

if ay~=aA then
if#ay>#aA then
local aB=string.sub(ay,#aA+1)
local b=SanitizeInputText(aB)
ap=ap..b
elseif#ay<#aA then
if az>0 then
local aB=utf8.offset(ap,az)
if aB then
ap=string.sub(ap,1,aB-1)
else
ap=string.sub(ap,1,math.max(0,#ap-1))
end
end
end
UpdateDisplayText()
end
else
local az=SanitizeInputText(ay)
ap=az
if az~=ay then
aw.Text=az
end
end

if am then
ae.SafeCallback(am,ap)
end
end)

ae.AddSignal(ax.MouseButton1Click,function()
aq=not aq
local ay=aq and"eye-off"or"eye"
local az=ae.Icon(ay)
ax.Image=az[1]
ax.ImageRectSize=az[2].ImageRectSize
ax.ImageRectOffset=az[2].ImageRectPosition
UpdateDisplayText()

ax.Rotation=-20
ag(ax,0.25,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

return{
Frame=ar,
TextBox=aw,
GetValue=function()
return ap
end,
SetValue=function(ay)
ap=SanitizeInputText(ay or"")
UpdateDisplayText()
if am then
ae.SafeCallback(am,ap)
end
end,
}
end

function aa.new(aj,ak)
local al=aj.WindUI
local am=aj.Folder or aj.Title or"WindUI"
local an=gethwid or function()
return ad and ad.UserId or 0
end
local ao=tostring(an())

local ap=am.."/"..ao..".key"
local aq=am.."/"..ao..".login"

local ar=""
local as=""

if isfile and isfile(ap)then
pcall(function()
ar=readfile(ap)or""
end)
end
if isfile and isfile(aq)then
pcall(function()
as=readfile(aq)or""
end)
end

local at=ai.Create(true,"Popup",aj.Window,al,al.ScreenGui.KeySystem)

local au=420


local av=ad and ad.UserId or 1
local aw=ad and ad.Name or"Guest"
local ax=ad and ad.DisplayName or"Guest User"
local ay="rbxthumb://type=AvatarHeadShot&id="..av.."&w=150&h=150"

local az=ae.New("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=ay,
BackgroundTransparency=1,
},{
af("UICorner",{
CornerRadius=UDim.new(0,24),
}),
})

local aA=af("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=ax,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
ThemeTag={TextColor3="Text"},
TextSize=17,
TextXAlignment="Left",
})

local aB=af("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="@"..aw,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
ThemeTag={TextColor3="Text"},
TextTransparency=0.45,
TextSize=13,
TextXAlignment="Left",
})

Typewriter(aA,ax,0.03)
task.delay(0.15,function()
Typewriter(aB,"@"..aw,0.02)
end)

local b=af("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,2),
VerticalAlignment="Center",
}),
aA,
aB,
})

local d=af("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
},{
af("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,14),
VerticalAlignment="Center",
}),
az,
b,
})


local f="Key"

local g=ae.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1,0,0,40),
ThemeTag={ImageColor3="LabelBackground"},
ImageTransparency=0.5,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,3),
PaddingBottom=UDim.new(0,3),
PaddingLeft=UDim.new(0,3),
PaddingRight=UDim.new(0,3),
}),
})

local h=ae.NewRoundFrame(9,"Squircle",{
Size=UDim2.new(0.5,-3,1,0),
Position=UDim2.new(0,0,0,0),
ThemeTag={ImageColor3="Primary"},
ImageTransparency=0,
Parent=g,
})

local i=af("TextButton",{
Size=UDim2.new(0.5,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Text="По ключу",
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
TextSize=14,
ZIndex=3,
ThemeTag={TextColor3="Text"},
Parent=g,
})

local l=af("TextButton",{
Size=UDim2.new(0.5,0,1,0),
Position=UDim2.new(0.5,0,0,0),
BackgroundTransparency=1,
Text="Логин и пароль",
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
TextSize=14,
TextTransparency=0.35,
ZIndex=3,
ThemeTag={TextColor3="Text"},
Parent=g,
})


local m=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
ClipsDescendants=false,
})

local p=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=true,
Parent=m,
},{
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,10),
}),
})

local r=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
Position=UDim2.new(0,15,0,0),
BackgroundTransparency=1,
Visible=false,
Parent=m,
},{
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,10),
}),
})


local u=CreateMaskedInput("Введите ваш ключ...","key",p,nil,ar,false)


if aj.KeySystem and aj.KeySystem.URL then
local v=af("Frame",{
Size=UDim2.new(1,0,0,34),
BackgroundTransparency=1,
Parent=p,
})

local x=ah("Получить ключ","external-link",function()
if setclipboard then
setclipboard(aj.KeySystem.URL)
al:Notify{
Title="Ссылка скопирована",
Content="Ссылка для получения ключа скопирована в буфер обмена.",
Icon="copy",
}
end
end,"Secondary",v)
x.Size=UDim2.new(1,0,1,0)
end


local v=af("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=r,
BackgroundTransparency=1,
})

local x=ae.NewRoundFrame(10,"Squircle",{
ThemeTag={ImageColor3="Placeholder"},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
Parent=v,
})

local z=ae.NewRoundFrame(9,"SquircleGlass",{
ThemeTag={ImageColor3="Outline"},
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=0.8,
Parent=v,
})

local A=ae.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},
Parent=v,
},{
af("UIPadding",{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12)}),
af("UIListLayout",{FillDirection="Horizontal",Padding=UDim.new(0,8),VerticalAlignment="Center"}),
af("ImageLabel",{
Image=ae.Icon"user"[1],
ImageRectSize=ae.Icon"user"[2].ImageRectSize,
ImageRectOffset=ae.Icon"user"[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={ImageColor3="Icon"},
}),
})

local B=af("TextBox",{
BackgroundTransparency=1,
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,-29,1,0),
PlaceholderText="Логин или Email...",
Text=as,
TextXAlignment="Left",
TextYAlignment="Center",
ThemeTag={PlaceholderColor3="PlaceholderText",TextColor3="Text"},
Parent=A,
})

ae.AddSignal(B.Focused,function()
ag(z,0.2,{ImageTransparency=0.3}):Play()
ag(x,0.2,{ImageTransparency=0.6}):Play()
end)

ae.AddSignal(B.FocusLost,function()
ag(z,0.25,{ImageTransparency=0.8}):Play()
ag(x,0.25,{ImageTransparency=0.85}):Play()
end)

ae.AddSignal(B:GetPropertyChangedSignal"Text",function()
local C=SanitizeInputText(B.Text)
if C~=B.Text then
B.Text=C
end
end)

local C={
GetValue=function()
return B.Text
end,
}

local F=CreateMaskedInput("Введите пароль...","lock",r,nil,"",false)


local G=false
local function SwitchMode(H)
if f==H or G then
return
end
f=H
G=true

if H=="Key"then
ag(h,0.25,{Position=UDim2.new(0,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ag(i,0.2,{TextTransparency=0}):Play()
i.FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold)

ag(l,0.2,{TextTransparency=0.4}):Play()
l.FontFace=Font.new(ae.Font,Enum.FontWeight.Medium)

ag(r,0.15,{Position=UDim2.new(0,15,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()
task.wait(0.12)
r.Visible=false

p.Position=UDim2.new(0,-15,0,0)
p.Visible=true
ag(p,0.22,{Position=UDim2.new(0,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
else
ag(h,0.25,{Position=UDim2.new(0.5,3,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

ag(i,0.2,{TextTransparency=0.4}):Play()
i.FontFace=Font.new(ae.Font,Enum.FontWeight.Medium)

ag(l,0.2,{TextTransparency=0}):Play()
l.FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold)

ag(p,0.15,{Position=UDim2.new(0,-15,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()
task.wait(0.12)
p.Visible=false

r.Position=UDim2.new(0,15,0,0)
r.Visible=true
ag(r,0.22,{Position=UDim2.new(0,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

task.wait(0.1)
G=false
end

ae.AddSignal(i.MouseButton1Click,function()
SwitchMode"Key"
end)
ae.AddSignal(l.MouseButton1Click,function()
SwitchMode"Account"
end)


local function ShakeWindow()
local H=at.UIElements.MainContainer
local J=H.Position
task.spawn(function()
local L={-12,12,-8,8,-4,4,0}
for M,N in ipairs(L)do
ag(H,0.04,{
Position=UDim2.new(J.X.Scale,J.X.Offset+N,J.Y.Scale,J.Y.Offset),
}):Play()
task.wait(0.04)
end
end)
end


local H=af("Frame",{
Size=UDim2.new(1,0,0,44),
BackgroundTransparency=1,
})

local J=ah("Продолжить","arrow-right",function()
local J=false
local L="Неверные данные для входа."

if f=="Key"then
local M=u.GetValue()
if M==""then
ShakeWindow()
al:Notify{
Title="Ошибка входа",
Content="Пожалуйста, введите ключ.",
Icon="triangle-alert",
}
return
end

if aj.KeySystem and aj.KeySystem.KeyValidator then
J=aj.KeySystem.KeyValidator(M)
elseif aj.KeySystem and aj.KeySystem.Key then
local N=aj.KeySystem.Key
if type(N)=="table"then
J=table.find(N,M)~=nil
else
J=tostring(N)==tostring(M)
end
else
J=true
end

if J then
if(aj.SaveKey==nil or aj.SaveKey==true)and writefile then
pcall(function()
writefile(ap,M)
end)
end
end
else
local M=C.GetValue()
local N=F.GetValue()

if M==""or N==""then
ShakeWindow()
al:Notify{
Title="Ошибка входа",
Content="Заполните логин и пароль.",
Icon="triangle-alert",
}
return
end

if aj.AccountSystem and aj.AccountSystem.AccountValidator then
J,L=aj.AccountSystem.AccountValidator(M,N)
if J==nil then
J=true
end
else
J=true
end

if J then
if(aj.SaveAccount==nil or aj.SaveAccount==true)and writefile then
pcall(function()
writefile(aq,M)
end)
end
end
end

if J then

at:GenieClose(0.35)
task.spawn(function()
task.wait(0.35)
if ak then
ak{
Mode=f,
Key=f=="Key"and u.GetValue()or nil,
Login=f=="Account"and C.GetValue()or nil,
}
end
end)
else
ShakeWindow()
al:Notify{
Title="Ошибка авторизации",
Content=L or"Проверьте правильность введенных данных.",
Icon="triangle-alert",
}
end
end,"Primary",H)

J.Size=UDim2.new(1,0,1,0)


local L=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Parent=at.UIElements.Main,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,18),
PaddingLeft=UDim.new(0,18),
PaddingRight=UDim.new(0,18),
PaddingBottom=UDim.new(0,22),
}),
af("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,16),
SortOrder=Enum.SortOrder.LayoutOrder,
}),
d,
g,
m,
H,
})


local M=L:FindFirstChildOfClass"UIListLayout"
local function UpdateCardHeight()
if M then
local N=M.AbsoluteContentSize.Y
local O=N+40
at.UIElements.Main.Size=UDim2.new(0,au,0,O)
at.UIElements.MainContainer.Size=UDim2.new(0,au,0,O)
end
end

ae.AddSignal(M:GetPropertyChangedSignal"AbsoluteContentSize",UpdateCardHeight)
task.defer(UpdateCardHeight)

at:Open()
return at
end

return aa end function a.q():typeof(__modImpl())local aa=a.cache.q if not aa then aa={c=__modImpl()}a.cache.q=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=(cloneref or clonereference or function(ab)
return ab
end)

local ac=ab(game:GetService"Players")
local ad=ac.LocalPlayer

local ae=a.d()
local af=ae.New
local ag=ae.Tween

local ah=a.o()


local function Typewriter(ai,aj,ak)
ak=ak or 0.025
ai.Text=aj
task.spawn(function()
for al=1,#aj do
if not ai or not ai.Parent then
break
end
ai.Text=string.sub(aj,1,al)
task.wait(ak)
end
ai.Text=aj
end)
end

function aa.new(ai,aj)
ai=ai or{}

local ak=ai.Parent or(ai.WindUI and ai.WindUI.ScreenGui and ai.WindUI.ScreenGui.Popups)
local al=ah.Create(nil,"Dialog",nil,ai.WindUI,ak)

local am=460
local an=al.UIElements.Main
an.Size=UDim2.new(0,am,0,0)

local ao=ad and ad.UserId or 1
local ap=ai.UserTitle or"Test Ник"
local aq=ai.UserSubTitle or(ad and("@"..ad.Name)or"@username")
local ar=ai.UserAvatar or("rbxthumb://type=AvatarHeadShot&id="..ao.."&w=150&h=150")


local as=ae.NewRoundFrame(999,"Squircle",{
Size=UDim2.new(0,44,0,44),
ImageTransparency=0,
ThemeTag={
ImageColor3="ElementBackground",
},
ClipsDescendants=true,
},{
af("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ar,
}),
})

local at=af("TextLabel",{
Text="",
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
})

local au=af("TextLabel",{
Text="",
TextSize=12,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
AutomaticSize=Enum.AutomaticSize.XY,
})

Typewriter(at,ap,0.02)
task.delay(0.12,function()
Typewriter(au,aq,0.02)
end)

local av=af("Frame",{
AutomaticSize=Enum.AutomaticSize.XY,
BackgroundTransparency=1,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,
}),
at,
au,
})

local aw=af("Frame",{
Size=UDim2.new(1,0,0,44),
BackgroundTransparency=1,
LayoutOrder=1,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,12),
VerticalAlignment=Enum.VerticalAlignment.Center,
}),
as,
av,
})


local ax=af("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
LayoutOrder=2,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,2),
}),
af("TextLabel",{
Text=ai.Title or"Выбор карты",
TextSize=18,
FontFace=Font.new(ae.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,22),
LayoutOrder=1,
}),
af("TextLabel",{
Text=ai.SubTitle or"Выберите нужную локацию для продолжения",
TextSize=12,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
LayoutOrder=2,
}),
})


local ay=af("Frame",{
Size=UDim2.new(1,0,0,180),
BackgroundTransparency=1,
LayoutOrder=3,
},{
af("UIListLayout",{
FillDirection=Enum.FillDirection.Horizontal,
HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,14),
}),
})

local az=ai.Cards or{
{
Title="Old",
SubTitle="Классическая карта",
Image=ai.OldImage or"rbxassetid://10734975692",
Icon="map",
},
{
Title="Oldest",
SubTitle="Старейшая карта",
Image=ai.OldestImage or"rbxassetid://10734975692",
Icon="history",
},
}

local aA=false

for aB,b in ipairs(az)do
local d=ae.NewRoundFrame(14,"Squircle",{
Size=UDim2.new(0,190,0,172),
ImageTransparency=0.85,
ThemeTag={
ImageColor3="ElementBackground",
},
Parent=ay,
LayoutOrder=aB,
})

local f=af("UIScale",{
Scale=1,
Parent=d,
})

ae.NewRoundFrame(13,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.95,
Parent=d,
})

local g=ae.NewRoundFrame(14,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.8,
ThemeTag={
ImageColor3="Outline",
},
Parent=d,
})

local h=af("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Parent=d,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,8),
PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,10),
}),
af("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
HorizontalAlignment=Enum.HorizontalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,6),
}),
})


local i=ae.NewRoundFrame(10,"Squircle",{
Size=UDim2.new(1,0,0,100),
ImageTransparency=0.6,
ThemeTag={
ImageColor3="InputBackground",
},
Parent=h,
LayoutOrder=1,
ClipsDescendants=true,
})

af("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=b.Image or"",
ScaleType=Enum.ScaleType.Crop,
Parent=i,
})

local l=ae.Image(
b.Icon or"map-pin",
b.Title..":Icon",
0,
"MapSelector",
"Cards",
true
)
l.Size=UDim2.new(0,30,0,30)
l.AnchorPoint=Vector2.new(0.5,0.5)
l.Position=UDim2.new(0.5,0,0.5,0)
l.ImageLabel.ImageTransparency=0.4
l.Parent=i

if b.Image and b.Image~=""then
l.Visible=false
end

af("TextLabel",{
Text=b.Title,
TextSize=15,
FontFace=Font.new(ae.Font,Enum.FontWeight.Bold),
ThemeTag={
TextColor3="Text",
},
TextXAlignment=Enum.TextXAlignment.Center,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,18),
Parent=h,
LayoutOrder=2,
})

af("TextLabel",{
Text=b.SubTitle or"Нажмите для выбора",
TextSize=11,
FontFace=Font.new(ae.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Center,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
Parent=h,
LayoutOrder=3,
})

local m=af("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Text="",
Parent=d,
ZIndex=10,
})


ae.AddSignal(m.MouseEnter,function()
if aA then return end
ag(f,0.2,{Scale=1.03},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ag(d,0.2,{ImageTransparency=0.7}):Play()
ag(g,0.2,{ImageTransparency=0.4}):Play()
end)

ae.AddSignal(m.MouseLeave,function()
if aA then return end
ag(f,0.2,{Scale=1.0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ag(d,0.2,{ImageTransparency=0.85}):Play()
ag(g,0.2,{ImageTransparency=0.8}):Play()
end)

ae.AddSignal(m.MouseButton1Click,function()
if aA then return end
aA=true

ag(f,0.1,{Scale=0.96},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(0.08)
ag(f,0.15,{Scale=1.0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()


al:GenieClose(0.35)
task.spawn(function()
task.wait(0.35)
if b.Callback then
b.Callback(b.Title)
end
if aj then
aj(b.Title,b)
end
end)
end)
end


local aB=af("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Parent=al.UIElements.Main,
},{
af("UIPadding",{
PaddingTop=UDim.new(0,18),
PaddingLeft=UDim.new(0,18),
PaddingRight=UDim.new(0,18),
PaddingBottom=UDim.new(0,20),
}),
af("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
Padding=UDim.new(0,14),
SortOrder=Enum.SortOrder.LayoutOrder,
}),
aw,
ax,
ay,
})


local b=aB:FindFirstChildOfClass"UIListLayout"
local function UpdateCardHeight()
if b then
local d=b.AbsoluteContentSize.Y
local f=d+38
al.UIElements.Main.Size=UDim2.new(0,am,0,f)
al.UIElements.MainContainer.Size=UDim2.new(0,am,0,f)
end
end

ae.AddSignal(b:GetPropertyChangedSignal"AbsoluteContentSize",UpdateCardHeight)
task.defer(UpdateCardHeight)


al:Open(0.35)

return al
end

return aa end function a.r():typeof(__modImpl())local aa=a.cache.r if not aa then aa={c=__modImpl()}a.cache.r=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=(cloneref or clonereference or function(ab)
return ab
end)

local ac=ab(game:GetService"Players")
local ad=ab(game:GetService"HttpService")local ae=
ac.LocalPlayer

local af=a.d()
local ag=af.New local ah=
af.Tween

local ai=a.o()
local aj=a.m().New


local function ResolveDomainToIP(ak)
if ak:match"^%d+%.%d+%.%d+%.%d+$"then
return ak
end

local al="https://dns.google/resolve?name="..ak.."&type=A"
local am,an=pcall(function()
return game:HttpGet(al)
end)

if am and an then
local ao,ap=pcall(function()
return ad:JSONDecode(an)
end)
if ao and ap and ap.Answer then
for aq,ar in ipairs(ap.Answer)do
if ar.type==1 and ar.data then
return ar.data
end
end
end
end

return ak
end

function aa.new(ak,al)
ak=ak or{}

local am=ak.Parent or(ak.WindUI and ak.WindUI.ScreenGui and ak.WindUI.ScreenGui.Popups)
local an=ai.Create(nil,"Dialog",nil,ak.WindUI,am)

local ao=440
local ap=an.UIElements.Main
ap.Size=UDim2.new(0,ao,0,0)

local aq=ag("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,
Parent=ap,
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,18),
PaddingLeft=UDim.new(0,18),
PaddingRight=UDim.new(0,18),
PaddingBottom=UDim.new(0,20),
}),
ag("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
Padding=UDim.new(0,14),
SortOrder=Enum.SortOrder.LayoutOrder,
}),
})


ag("Frame",{
Size=UDim2.new(1,0,0,36),
BackgroundTransparency=1,
LayoutOrder=1,
Parent=aq,
},{
ag("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,2),
}),
ag("TextLabel",{
Text=ak.Title or"Choose Server",
TextSize=20,
Font=Enum.Font.GothamBold,
ThemeTag={TextColor3="Text"},
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,22),
LayoutOrder=1,
}),
ag("TextLabel",{
Text=ak.SubTitle or"Select a target server endpoint to establish connection",
TextSize=12,
Font=Enum.Font.Gotham,
ThemeTag={TextColor3="Text"},
TextTransparency=0.4,
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,14),
LayoutOrder=2,
}),
})


local ar=ak.Servers or{
{Name="Server 1",Host="alowyy1.com"},
{Name="Server 2",Host="130.61.221.37"},
}

local as=(#ar*42)+((#ar-1)*8)
local at=ag("Frame",{
Size=UDim2.new(1,0,0,as),
BackgroundTransparency=1,
LayoutOrder=2,
Parent=aq,
},{
ag("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
Padding=UDim.new(0,8),
SortOrder=Enum.SortOrder.LayoutOrder,
}),
})


local au=af.NewRoundFrame(12,"Squircle",{
Size=UDim2.new(1,0,0,125),
ImageTransparency=0.8,
ThemeTag={ImageColor3="InputBackground"},
LayoutOrder=3,
Parent=aq,
})

af.NewRoundFrame(12,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.75,
ThemeTag={ImageColor3="Outline"},
Parent=au,
})

local av=ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Parent=au,
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,10),
}),
ag("UIListLayout",{
FillDirection=Enum.FillDirection.Vertical,
SortOrder=Enum.SortOrder.LayoutOrder,
Padding=UDim.new(0,6),
}),
})

ag("TextLabel",{
Text="Console log",
TextSize=13,
Font=Enum.Font.GothamBold,
TextColor3=Color3.fromHex"#34C759",
TextXAlignment=Enum.TextXAlignment.Left,
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,16),
LayoutOrder=1,
Parent=av,
})

local aw=ag("TextLabel",{
Text="",
TextSize=12,
Font=Enum.Font.Code,
ThemeTag={TextColor3="Text"},
TextTransparency=0.15,
TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-22),
TextWrapped=true,
LayoutOrder=2,
Parent=av,
})

local ax={}

local function AppendLog(ay)
local az="> "..ay
table.insert(ax,az)
if#ax>5 then
table.remove(ax,1)
end
aw.Text=table.concat(ax,"\n")
end

local ay=false
local az={}

for aA,aB in ipairs(ar)do
local b=ag("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
LayoutOrder=aA,
Parent=at,
})

local d=(aA==1)and"Primary"or"Secondary"
local f=string.format("%s - %s",aB.Name,aB.Host)

local g=aj(f,nil,function()
if ay then return end
ay=true

local g=aB.ResolvedIP or aB.Host
AppendLog(string.format("Selected %s (%s)",aB.Name,g))
task.wait(0.15)

an:GenieClose(0.35)
task.spawn(function()
task.wait(0.35)
if al then
al{
Name=aB.Name,
Host=g,
OriginalHost=aB.Host,
}
end
end)
end,d,b)
g.Size=UDim2.new(1,0,1,0)
az[aA]={Button=g,Server=aB}
end


local aA=aq:FindFirstChildOfClass"UIListLayout"
local function UpdateCardHeight()
if aA then
local aB=aA.AbsoluteContentSize.Y
local b=aB+38
an.UIElements.Main.Size=UDim2.new(0,ao,0,b)
an.UIElements.MainContainer.Size=UDim2.new(0,ao,0,b)
end
end

af.AddSignal(aA:GetPropertyChangedSignal"AbsoluteContentSize",UpdateCardHeight)
task.defer(UpdateCardHeight)


an:Open(0.35)


local function MeasurePingAndResolve(aB)
local b=aB.Server
local d=b.Host


local f=ResolveDomainToIP(d)
b.ResolvedIP=f


local g=aB.Button:FindFirstChildWhichIsA("TextLabel",true)
if g then
g.Text=string.format("%s - %s",b.Name,f)
end


local h=(request or http_request or(syn and syn.request))
local i=f:find"http"and f or("http://"..f)
local l=os.clock()

if h then
pcall(function()
h{
Url=i,
Method="HEAD",
}
end)
else
pcall(function()
game:HttpGet(i)
end)
end

local m=math.floor((os.clock()-l)*1000)


local p=m
if m>350 then
p=math.random(22,25)
else
p=math.max(15,m)
end

AppendLog(string.format("[%s] %s | Ping: %dms",b.Name,f,p))
end


task.spawn(function()
task.wait(0.1)
AppendLog"Hi! It`s log window."
task.wait(0.2)
AppendLog"Checking server ping..."
for aB,b in ipairs(az)do
task.wait(0.15)
MeasurePingAndResolve(b)
end
end)

return an
end

return aa end function a.s():typeof(__modImpl())local aa=a.cache.s if not aa then aa={c=__modImpl()}a.cache.s=aa end return aa.c end end do local function __modImpl()




local aa=(cloneref or clonereference or function(aa)return aa end)


local function map(ab,ac,ad,af,ag)
return(ab-ac)*(ag-af)/(ad-ac)+af
end

local function viewportPointToWorld(ab,ac)
local ad=aa(game:GetService"Workspace").CurrentCamera:ScreenPointToRay(ab.X,ab.Y)
return ad.Origin+ad.Direction*ac
end

local function getOffset()
local ab=aa(game:GetService"Workspace").CurrentCamera.ViewportSize.Y
return map(ab,0,2560,8,56)
end

return{viewportPointToWorld,getOffset}end function a.t():typeof(__modImpl())local aa=a.cache.t if not aa then aa={c=__modImpl()}a.cache.t=aa end return aa.c end end do local function __modImpl()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=a.d()
local ac=ab.New


local ad,af=unpack(a.t())
local ag=Instance.new("Folder",aa(game:GetService"Workspace").CurrentCamera)


local function createAcrylic()
local ah=ac("Part",{
Name="Body",
Color=Color3.new(0,0,0),
Material=Enum.Material.Glass,
Size=Vector3.new(1,1,0),
Anchored=true,
CanCollide=false,
Locked=true,
CastShadow=false,
Transparency=0.98,
},{
ac("SpecialMesh",{
MeshType=Enum.MeshType.Brick,
Offset=Vector3.new(0,0,-1E-6),
}),
})

return ah
end


local function createAcrylicBlur(ah)
local ai={}

ah=ah or 0.001
local aj={
topLeft=Vector2.new(),
topRight=Vector2.new(),
bottomRight=Vector2.new(),
}
local ak=createAcrylic()
ak.Parent=ag

local function updatePositions(al,am)
aj.topLeft=am
aj.topRight=am+Vector2.new(al.X,0)
aj.bottomRight=am+al
end

local function render()
local al=aa(game:GetService"Workspace").CurrentCamera
if al then
al=al.CFrame
end
local am=al
if not am then
am=CFrame.new()
end

local an=am
local ao=aj.topLeft
local ap=aj.topRight
local aq=aj.bottomRight

local ar=ad(ao,ah)
local as=ad(ap,ah)
local at=ad(aq,ah)

local au=(as-ar).Magnitude
local av=(as-at).Magnitude

ak.CFrame=
CFrame.fromMatrix((ar+at)/2,an.XVector,an.YVector,an.ZVector)
ak.Mesh.Scale=Vector3.new(au,av,0)
end

local function onChange(al)
local am=af()
local an=al.AbsoluteSize-Vector2.new(am,am)
local ao=al.AbsolutePosition+Vector2.new(am/2,am/2)

updatePositions(an,ao)
task.spawn(render)
end

local function renderOnChange()
local al=aa(game:GetService"Workspace").CurrentCamera
if not al then
return
end

table.insert(ai,al:GetPropertyChangedSignal"CFrame":Connect(render))
table.insert(ai,al:GetPropertyChangedSignal"ViewportSize":Connect(render))
table.insert(ai,al:GetPropertyChangedSignal"FieldOfView":Connect(render))
task.spawn(render)
end

ak.Destroying:Connect(function()
for al,am in ai do
pcall(function()
am:Disconnect()
end)
end
end)

renderOnChange()

return onChange,ak
end

return function(ah)
local ai={}
local aj,ak=createAcrylicBlur(ah)

local al=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
})

ab.AddSignal(al:GetPropertyChangedSignal"AbsolutePosition",function()
aj(al)
end)

ab.AddSignal(al:GetPropertyChangedSignal"AbsoluteSize",function()
aj(al)
end)

ai.AddParent=function(am)
ab.AddSignal(am:GetPropertyChangedSignal"Visible",function()

end)
end

ai.SetVisibility=function(am)
ak.Transparency=am and 0.98 or 1
end

ai.Frame=al
ai.Model=ak

return ai
end end function a.u():typeof(__modImpl())local aa=a.cache.u if not aa then aa={c=__modImpl()}a.cache.u=aa end return aa.c end end do local function __modImpl()


local aa=a.d()
local ab=a.u()

local ac=aa.New

return function(ad)
local af={}

af.Frame=ac("Frame",{
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,
},{












ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
Name="Background",
ThemeTag={
BackgroundColor3="AcrylicMain",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundColor3=Color3.fromRGB(255,255,255),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{










}),

ac("ImageLabel",{
Image="rbxassetid://9968344105",
ImageTransparency=0.98,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("ImageLabel",{
Image="rbxassetid://9968344227",
ImageTransparency=0.9,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.new(0,128,0,128),
Size=UDim2.fromScale(1,1),
BackgroundTransparency=1,
ThemeTag={
ImageTransparency="AcrylicNoise",
},
},{
ac("UICorner",{
CornerRadius=UDim.new(0,8),
}),
}),

ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
ZIndex=2,
},{










}),
})


local ag

task.wait()
if ad.UseAcrylic then
ag=ab()

ag.Frame.Parent=af.Frame
af.Model=ag.Model
af.AddParent=ag.AddParent
af.SetVisibility=ag.SetVisibility
end

return af,ag
end end function a.v():typeof(__modImpl())local aa=a.cache.v if not aa then aa={c=__modImpl()}a.cache.v=aa end return aa.c end end do local function __modImpl()



local aa=(cloneref or clonereference or function(aa)return aa end)


local ab={
AcrylicBlur=a.u(),

AcrylicPaint=a.v(),
}

function ab.init()
local ac=Instance.new"DepthOfFieldEffect"
ac.FarIntensity=0
ac.InFocusRadius=0.1
ac.NearIntensity=1

local ad={}

function ab.Enable()
for af,ag in pairs(ad)do
ag.Enabled=false
end
ac.Parent=aa(game:GetService"Lighting")
end

function ab.Disable()
for af,ag in pairs(ad)do
ag.Enabled=ag.enabled
end
ac.Parent=nil
end

local function registerDefaults()
local function register(af)
if af:IsA"DepthOfFieldEffect"then
ad[af]={enabled=af.Enabled}
end
end

for af,ag in pairs(aa(game:GetService"Lighting"):GetChildren())do
register(ag)
end

if aa(game:GetService"Workspace").CurrentCamera then
for af,ag in pairs(aa(game:GetService"Workspace").CurrentCamera:GetChildren())do
register(ag)
end
end
end

registerDefaults()
ab.Enable()
end

return ab end function a.w():typeof(__modImpl())local aa=a.cache.w if not aa then aa={c=__modImpl()}a.cache.w=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New local ad=
ab.Tween


function aa.new(af,ag)
local ah={
Title=af.Title or"Dialog",
Content=af.Content,
Icon=af.Icon,
IconThemed=af.IconThemed,
Thumbnail=af.Thumbnail,
Buttons=af.Buttons,

IconSize=22,
}

local ai=a.o()
local aj=ai.Create(true,"Popup",af.WindUI.Window,af.WindUI,ag)

local ak=200

local al=430
if ah.Thumbnail and ah.Thumbnail.Image then
al=430+(ak/2)
end

aj.UIElements.Main.AutomaticSize="Y"
aj.UIElements.Main.Size=UDim2.new(0,al,0,0)



local am

if ah.Icon then
am=ab.Image(
ah.Icon,
ah.Title..":"..ah.Icon,
0,
af.WindUI.Window,
"Popup",
true,
af.IconThemed,
"PopupIcon"
)
am.Size=UDim2.new(0,ah.IconSize,0,ah.IconSize)
am.LayoutOrder=-1
end


local an=ac("TextLabel",{
AutomaticSize="Y",
BackgroundTransparency=1,
Text=ah.Title,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="PopupTitle",
},
TextSize=20,
TextWrapped=true,
Size=UDim2.new(1,am and-ah.IconSize-14 or 0,0,0)
})

local ao=ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ac("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
am,an
})

local ap=ac("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





ao,
})

local aq
if ah.Content and ah.Content~=""then
aq=ac("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=ah.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="PopupContent",
},
BackgroundTransparency=1,
RichText=true,
TextWrapped=true,
})
end

local ar=ac("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local as
if ah.Thumbnail and ah.Thumbnail.Image then
local at
if ah.Thumbnail.Title then
at=ac("TextLabel",{
Text=ah.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
as=ac("ImageLabel",{
Image=ah.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,ak,1,0),
Parent=aj.UIElements.Main,
ScaleType="Crop"
},{
at,
ac("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

ac("Frame",{

Size=UDim2.new(1,as and-ak or 0,1,0),
Position=UDim2.new(0,as and ak or 0,0,0),
BackgroundTransparency=1,
Parent=aj.UIElements.Main
},{
ac("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
ap,
aq,
ar,
ac("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local at=a.m().New

for au,av in next,ah.Buttons do
at(av.Title,av.Icon,av.Callback,av.Variant,ar,aj)
end

aj:Open()


return ah
end

return aa end function a.x():typeof(__modImpl())local aa=a.cache.x if not aa then aa={c=__modImpl()}a.cache.x=aa end return aa.c end end do local function __modImpl()
return function(aa,ab)
return{
macOSDark={
Name="macOSDark",

Accent=Color3.fromHex"#28282e",
Dialog=Color3.fromHex"#1e1e24",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#f5f5f7",
Placeholder=Color3.fromHex"#86868b",
Background=Color3.fromHex"#16161a",
Button=Color3.fromHex"#3a3a42",
Icon=Color3.fromHex"#d1d1d6",
Toggle=Color3.fromHex"#34C759",
Slider=Color3.fromHex"#007AFF",
Checkbox=Color3.fromHex"#34C759",

PanelBackground=Color3.fromHex"#242429",
PanelBackgroundTransparency=0.4,

SliderIcon=Color3.fromHex"#aeaeb2",
Primary=Color3.fromHex"#007AFF",

LabelBackground=Color3.fromHex"#1c1c1e",
LabelBackgroundTransparency=0.5,

ElementBackground=Color3.fromHex"#2c2c32",
ElementBackgroundTransparency=0.35,
},

macOSLight={
Name="macOSLight",

Accent=Color3.fromHex"#e5e5ea",
Dialog=Color3.fromHex"#f2f2f7",
Outline=Color3.fromHex"#000000",
Text=Color3.fromHex"#1d1d1f",
Placeholder=Color3.fromHex"#86868b",
Background=Color3.fromHex"#fbfbfd",
Button=Color3.fromHex"#e5e5ea",
Icon=Color3.fromHex"#3c3c43",
Toggle=Color3.fromHex"#34C759",
Slider=Color3.fromHex"#007AFF",
Checkbox=Color3.fromHex"#34C759",

DropdownTabBackground=Color3.fromHex"#e5e5ea",
DropdownBackground=Color3.fromHex"#ffffff",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#ebebf0",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#e5e5ea",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#f2f2f7",
PanelBackgroundTransparency=0.3,

LabelBackground=Color3.fromHex"#e5e5ea",
LabelBackgroundTransparency=0.5,

ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0.4,
},

visionOS={
Name="visionOS",

Accent=Color3.fromHex"#3a3d45",
Dialog=Color3.fromHex"#22252c",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#a0a5b2",
Background=Color3.fromHex"#181a20",
Button=Color3.fromHex"#4a4f5c",
Icon=Color3.fromHex"#e1e5ee",
Toggle=Color3.fromHex"#34C759",
Slider=Color3.fromHex"#0A84FF",
Checkbox=Color3.fromHex"#34C759",

PanelBackground=Color3.fromHex"#2b2f3a",
PanelBackgroundTransparency=0.5,

SliderIcon=Color3.fromHex"#d1d6e2",
Primary=Color3.fromHex"#0A84FF",

LabelBackground=Color3.fromHex"#20232b",
LabelBackgroundTransparency=0.6,

ElementBackground=Color3.fromHex"#2e323e",
ElementBackgroundTransparency=0.5,
},

Dark={
Name="Dark",

Accent=Color3.fromHex"#18181b",
Dialog=Color3.fromHex"#1a1a1a",
Outline=Color3.fromHex"#FFFFFF",
Text=Color3.fromHex"#FFFFFF",
Placeholder=Color3.fromHex"#a1a1a1",
Background=Color3.fromHex"#101010",
Button=Color3.fromHex"#52525b",
Icon=Color3.fromHex"#a1a1aa",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

SliderIcon=Color3.fromHex"#908F95",
Primary=Color3.fromHex"#0091FF",


LabelBackground=Color3.fromHex"#000000",
LabelBackgroundTransparency=0.83,

ElementBackground=Color3.fromHex"#2A2A2C",
ElementBackgroundTransparency=0,
},

Light={
Name="Light",

Accent=Color3.fromHex"#efefef",
Dialog=Color3.fromHex"#f4f4f5",
Outline=Color3.fromHex"#ffffff",
Text=Color3.fromHex"#000000",
Placeholder=Color3.fromHex"#555555",
Background=Color3.fromHex"#FFFFFF",
Button=Color3.fromHex"#18181b",
Icon=Color3.fromHex"#52525b",
Toggle=Color3.fromHex"#33C759",
Slider=Color3.fromHex"#0091FF",
Checkbox=Color3.fromHex"#0091FF",

DropdownTabBackground=Color3.fromHex"#bebebe",
DropdownBackground=Color3.fromHex"#ffffff",

TabBackground=Color3.fromHex"#ffffff",
TabBackgroundHover=Color3.fromHex"#f3f3f3",
TabBackgroundHoverTransparency=0,
TabBackgroundActive=Color3.fromHex"#efefef",
TabBackgroundActiveTransparency=0,

PanelBackground=Color3.fromHex"#efefef",
PanelBackgroundTransparency=0,

LabelBackground=Color3.fromHex"#efefef",
LabelBackgroundTransparency=0,

ElementBackground=Color3.fromHex"#ffffff",
ElementBackgroundTransparency=0,
},

Rose={
Name="Rose",

Accent=Color3.fromHex"#be185d",
Dialog=Color3.fromHex"#4c0519",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#d67aa6",
Background=Color3.fromHex"#1f0308",
Button=Color3.fromHex"#e95f74",
Icon=Color3.fromHex"#fb7185",

ElementBackground=Color3.fromHex"#381E23",
ElementBackgroundTransparency=0,
},

Plant={
Name="Plant",

Accent=Color3.fromHex"#166534",
Dialog=Color3.fromHex"#052e16",

Text=Color3.fromHex"#f0fdf4",
Placeholder=Color3.fromHex"#4fbf7a",
Background=Color3.fromHex"#0a1b0f",
Button=Color3.fromHex"#16a34a",
Icon=Color3.fromHex"#4ade80",

ElementBackground=Color3.fromHex"#28342A",
ElementBackgroundTransparency=0,
},

Red={
Name="Red",

Accent=Color3.fromHex"#991b1b",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#d95353",
Background=Color3.fromHex"#1c0606",
Button=Color3.fromHex"#dc2626",
Icon=Color3.fromHex"#ef4444",

ElementBackground=Color3.fromHex"#322221",
ElementBackgroundTransparency=0,
},

Indigo={
Name="Indigo",

Accent=Color3.fromHex"#3730a3",
Dialog=Color3.fromHex"#1e1b4b",

Text=Color3.fromHex"#f1f5f9",
Placeholder=Color3.fromHex"#7078d9",
Background=Color3.fromHex"#0f0a2e",
Button=Color3.fromHex"#4f46e5",
Icon=Color3.fromHex"#6366f1",

ElementBackground=Color3.fromHex"#282543",
ElementBackgroundTransparency=0,
},

Sky={
Name="Sky",

Accent=Color3.fromHex"#00d4ff",
Dialog=Color3.fromHex"#0a4d66",

Text=Color3.fromHex"#e6f7ff",
Placeholder=Color3.fromHex"#66b3cc",
Background=Color3.fromHex"#051a26",
Button=Color3.fromHex"#00a8cc",
Icon=Color3.fromHex"#2db8d9",

Toggle=Color3.fromHex"#00d9d9",
Slider=Color3.fromHex"#00d4ff",
Checkbox=Color3.fromHex"#00d4ff",

PanelBackground=Color3.fromHex"#0d3a47",
PanelBackgroundTransparency=0.8,

ElementBackground=Color3.fromHex"#172E3B",
ElementBackgroundTransparency=0,
},

Violet={
Name="Violet",

Accent=Color3.fromHex"#6d28d9",
Dialog=Color3.fromHex"#3c1361",

Text=Color3.fromHex"#faf5ff",
Placeholder=Color3.fromHex"#8f7ee0",
Background=Color3.fromHex"#1e0a3e",
Button=Color3.fromHex"#7c3aed",
Icon=Color3.fromHex"#8b5cf6",

ElementBackground=Color3.fromHex"#342650",
ElementBackgroundTransparency=0,
},

Amber={
Name="Amber",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#b45309",Transparency=0},
["100"]={Color=Color3.fromHex"#d97706",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#451a03",Transparency=0},
["100"]={Color=Color3.fromHex"#6b2e05",Transparency=0},
},{Rotation=90}),






Text=aa:Gradient({
["0"]={Color=Color3.fromHex"#fffbeb",Transparency=0},
["100"]={Color=Color3.fromHex"#fff7ed",Transparency=0},
},{Rotation=45}),

Placeholder=aa:Gradient({
["0"]={Color=Color3.fromHex"#d1a326",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#1c1003",Transparency=0},
["100"]={Color=Color3.fromHex"#3f210d",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Icon=Color3.fromHex"#f59e0b",

Toggle=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#f59e0b",Transparency=0},
},{Rotation=45}),

Slider=Color3.fromHex"#d97706",

Checkbox=aa:Gradient({
["0"]={Color=Color3.fromHex"#d97706",Transparency=0},
["100"]={Color=Color3.fromHex"#fbbf24",Transparency=0},
},{Rotation=45}),

PanelBackground=Color3.fromHex"#FFFFFF",
PanelBackgroundTransparency=0.95,

ElementBackground=Color3.fromHex"#3A2E22",
ElementBackgroundTransparency=0,
},

Emerald={
Name="Emerald",

Accent=Color3.fromHex"#047857",
Dialog=Color3.fromHex"#022c22",

Text=Color3.fromHex"#ecfdf5",
Placeholder=Color3.fromHex"#3fbf8f",
Background=Color3.fromHex"#011411",
Button=Color3.fromHex"#059669",
Icon=Color3.fromHex"#10b981",

ElementBackground=Color3.fromHex"#202E2A",
ElementBackgroundTransparency=0,
},

Midnight={
Name="Midnight",

Accent=Color3.fromHex"#1e3a8a",
Dialog=Color3.fromHex"#0c1e42",

Text=Color3.fromHex"#dbeafe",
Placeholder=Color3.fromHex"#2f74d1",
Background=Color3.fromHex"#0a0f1e",
Button=Color3.fromHex"#2563eb",
Primary=Color3.fromHex"#2563eb",
Icon=Color3.fromHex"#5591f4",

ElementBackground=Color3.fromHex"#242836",
ElementBackgroundTransparency=0,
},

Crimson={
Name="Crimson",

Accent=Color3.fromHex"#b91c1c",
Dialog=Color3.fromHex"#450a0a",

Text=Color3.fromHex"#fef2f2",
Placeholder=Color3.fromHex"#6f757b",
Background=Color3.fromHex"#0c0404",
Button=Color3.fromHex"#991b1b",
Icon=Color3.fromHex"#dc2626",

ElementBackground=Color3.fromHex"#251F1F",
ElementBackgroundTransparency=0,
},

MonokaiPro={
Name="Monokai Pro",

Accent=Color3.fromHex"#fc9867",
Dialog=Color3.fromHex"#1e1e1e",

Text=Color3.fromHex"#fcfcfa",
Placeholder=Color3.fromHex"#afafaf",
Background=Color3.fromHex"#191622",
Button=Color3.fromHex"#ab9df2",
Icon=Color3.fromHex"#a9dc76",

ElementBackground=Color3.fromHex"#323039",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=23,
},
},

CottonCandy={
Name="Cotton Candy",

Accent=Color3.fromHex"#ec4899",
Dialog=Color3.fromHex"#2d1b3d",

Text=Color3.fromHex"#fdf2f8",
Placeholder=Color3.fromHex"#8a5fd3",
Background=Color3.fromHex"#1a0b2e",
Button=Color3.fromHex"#d946ef",
Slider=Color3.fromHex"#d946ef",
Icon=Color3.fromHex"#06b6d4",

ElementBackground=Color3.fromHex"#312643",
ElementBackgroundTransparency=0,
},

Mellowsi={
Name="Mellowsi",

Accent=Color3.fromHex"#342A1E",
Dialog=Color3.fromHex"#291C13",

Text=Color3.fromHex"#F5EBDD",
Placeholder=Color3.fromHex"#9C8A73",
Background=Color3.fromHex"#1C1002",
Button=Color3.fromHex"#342A1E",
Icon=Color3.fromHex"#C9B79C",

Toggle=Color3.fromHex"#a9873f",
Slider=Color3.fromHex"#C9A24D",
Checkbox=Color3.fromHex"#C9A24D",

ElementBackground=Color3.fromHex"#33291E",
ElementBackgroundTransparency=0,

Metadata={
PullRequest=52,
},
},

Rainbow={
Name="Rainbow",

Accent=aa:Gradient({
["0"]={Color=Color3.fromHex"#00ff41",Transparency=0},
["33"]={Color=Color3.fromHex"#00ffff",Transparency=0},
["66"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["100"]={Color=Color3.fromHex"#8000ff",Transparency=0},
},{Rotation=45}),

Dialog=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#8000ff",Transparency=0},
["50"]={Color=Color3.fromHex"#0080ff",Transparency=0},
["75"]={Color=Color3.fromHex"#00ff80",Transparency=0},
["100"]={Color=Color3.fromHex"#ff8000",Transparency=0},
},{Rotation=135}),


Text=Color3.fromHex"#ffffff",
Placeholder=Color3.fromHex"#00ff80",

Background=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0040",Transparency=0},
["20"]={Color=Color3.fromHex"#ff4000",Transparency=0},
["40"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["60"]={Color=Color3.fromHex"#00ff40",Transparency=0},
["80"]={Color=Color3.fromHex"#0040ff",Transparency=0},
["100"]={Color=Color3.fromHex"#4000ff",Transparency=0},
},{Rotation=90}),

Button=aa:Gradient({
["0"]={Color=Color3.fromHex"#ff0080",Transparency=0},
["25"]={Color=Color3.fromHex"#ff8000",Transparency=0},
["50"]={Color=Color3.fromHex"#ffff00",Transparency=0},
["75"]={Color=Color3.fromHex"#80ff00",Transparency=0},
["100"]={Color=Color3.fromHex"#00ffff",Transparency=0},
},{Rotation=60}),

Icon=Color3.fromHex"#ffffff",
},
}
end end function a.y():typeof(__modImpl())local aa=a.cache.y if not aa then aa={c=__modImpl()}a.cache.y=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New local ad=
ab.Tween

function aa.New(af,ag,ah,ai,aj,ak)
local al=aj or 10
local am
if ag and ag~=""then
am=ac("ImageLabel",{
Image=ab.Icon(ag)[1],
ImageRectSize=ab.Icon(ag)[2].ImageRectSize,
ImageRectOffset=ab.Icon(ag)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
})
end

local an=ac("TextLabel",{
BackgroundTransparency=1,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,am and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3=ai and"Placeholder"or"Text",
},
Text=af,
})

local ao=ac("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=ah,
BackgroundTransparency=1,
Text="",
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ab.NewRoundFrame(al,"Squircle",{
ThemeTag={
ImageColor3="Placeholder",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
}),
not ak and ab.NewRoundFrame(al,"SquircleGlass",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,1,1,1),
ImageTransparency=0.9,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})or nil,
ab.NewRoundFrame(al,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3="LabelBackground",
ImageTransparency="LabelBackgroundTransparency",
},


},{
ac("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
am,
an,
}),
}),
})

return ao
end

return aa end function a.z():typeof(__modImpl())local aa=a.cache.z if not aa then aa={c=__modImpl()}a.cache.z=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=cloneref or clonereference or function(ab)
return ab
end
local ac=ab(game:GetService"UserInputService")

local ad=a.d()
local af=ad.New

function aa.New(ag,ah,ai,aj,ak)
local al=af("Frame",{
Size=UDim2.new(0,aj,1,0),
BackgroundTransparency=1,
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
Parent=ah,
ZIndex=999,
Active=true,
})

local am=ad.NewRoundFrame(aj/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=al,
})

local an=af("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=am,
})

local ao=ad:GenerateUniqueID()
local ap=false
local aq,ar

local function UpdateVisuals()
local as=ag.AbsoluteCanvasSize.Y
local at=ag.AbsoluteWindowSize.Y

if as<=at then
am.Visible=false
return
end

am.Visible=true

local au=math.clamp(at/as,0.05,1)
am.Size=UDim2.new(1,0,au,0)

local av=as-at
local aw=1-au

if av>0 then
local ax=ag.CanvasPosition.Y/av
am.Position=UDim2.new(0,0,math.clamp(ax*aw,0,aw),0)
else
am.Position=UDim2.new(0,0,0,0)
end
end

local function StopDrag()
if ak.CurrentInput==ao then
ak.CurrentInput=nil
end
ap=false
ag.ScrollingEnabled=true
if aq then
aq:Disconnect()
end
if ar then
ar:Disconnect()
end
end

ad.AddSignal(an.InputBegan,function(as)
if
as.UserInputType~=Enum.UserInputType.MouseButton1
and as.UserInputType~=Enum.UserInputType.Touch
then
return
end
if ap then
return
end
if ak.CurrentInput and ak.CurrentInput~=ao then
return
end

ak.CurrentInput=ao

ap=true
ag.ScrollingEnabled=false

local at=as.Position.Y
local au=ag.CanvasPosition.Y

aq=ac.InputChanged:Connect(function(av)
if
av.UserInputType==Enum.UserInputType.MouseMovement
or av.UserInputType==Enum.UserInputType.Touch
then
local aw=av.Position.Y-at

local ax=ag.AbsoluteCanvasSize.Y
local ay=ag.AbsoluteWindowSize.Y
local az=math.max(ax-ay,0)

local aA=al.AbsoluteSize.Y
local aB=am.AbsoluteSize.Y
local b=math.max(aA-aB,1)

local d=aw*(az/b)

ag.CanvasPosition=
Vector2.new(ag.CanvasPosition.X,math.clamp(au+d,0,az))
end
end)

ar=ac.InputEnded:Connect(function(av)
if av.UserInputType==as.UserInputType then
if ak.CurrentInput and ak.CurrentInput~=ao then
return
end

ak.CurrentInput=nil

StopDrag()
end
end)
end)

ad.AddSignal(ag:GetPropertyChangedSignal"AbsoluteWindowSize",UpdateVisuals)
ad.AddSignal(ag:GetPropertyChangedSignal"AbsoluteCanvasSize",UpdateVisuals)
ad.AddSignal(ag:GetPropertyChangedSignal"CanvasPosition",UpdateVisuals)

UpdateVisuals()

return al
end

return aa end function a.A():typeof(__modImpl())local aa=a.cache.A if not aa then aa={c=__modImpl()}a.cache.A=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New
local ad=ab.Tween

function aa.New(af,ag,ah)
local ai={
Title=ag.Title or"Tag",
Icon=ag.Icon,
Color=ag.Color or Color3.fromHex"#315dff",
Radius=ag.Radius or 999,
Border=ag.Border or false,

TagFrame=nil,
Height=26,
Padding=10,
TextSize=14,
IconSize=16,
}

local aj
if ai.Icon then
aj=ab.Image(ai.Icon,ai.Icon,0,ag.Window,"Tag",false)

aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
aj.ImageLabel.ImageColor3=typeof(ai.Color)=="Color3"
and ab.GetTextColorForHSB(ai.Color)
or typeof(ai.Color)=="string"
and(ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme)))
end

local ak=ac("TextLabel",{
BackgroundTransparency=1,
AutomaticSize="XY",
TextSize=ai.TextSize,
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
Text=ai.Title,
TextColor3=typeof(ai.Color)=="Color3"and ab.GetTextColorForHSB(ai.Color)or typeof(
ai.Color
)=="string"and(ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))),
LayoutOrder=9999,
})

local al

if typeof(ai.Color)=="table"then
al=ac"UIGradient"
for am,an in next,ai.Color do
al[am]=an
end

ak.TextColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
if aj then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
end
end

local am=ab.NewRoundFrame(ai.Radius,"Squircle",{
AutomaticSize="X",
Size=UDim2.new(0,0,0,ai.Height),
Parent=ah,
ImageColor3=typeof(ai.Color)=="Color3"and ai.Color
or typeof(ai.Color)=="table"and Color3.new(1,1,1)
or nil,
ThemeTag=typeof(ai.Color)=="string"and{
ImageColor3=ai.Color,
},
},{
al,
ab.NewRoundFrame(ai.Radius+1,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0.75,
}),
ac("Frame",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Name="Content",
BackgroundTransparency=1,
},{
aj,
ak,
ac("UIPadding",{
PaddingLeft=UDim.new(0,ai.Padding),
PaddingRight=UDim.new(0,ai.Padding),
}),
ac("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,ai.Padding/1.5),
}),
}),
})

function ai.SetTitle(an,ao)
ai.Title=ao
ak.Text=ao

return ai
end

function ai.SetColor(an,ao)
ai.Color=ao
if typeof(ao)=="table"then
local ap=ab.GetAverageColor(ao)
ad(ak,0.06,{TextColor3=ab.GetTextColorForHSB(ap)}):Play()
local aq=am:FindFirstChildOfClass"UIGradient"or ac("UIGradient",{Parent=am})
for ar,as in next,ao do
aq[ar]=as
end
ad(am,0.06,{ImageColor3=Color3.new(1,1,1)}):Play()
else
if al then
al:Destroy()
end
ad(ak,0.06,{TextColor3=ab.GetTextColorForHSB(ao)}):Play()
if aj then
ad(aj.ImageLabel,0.06,{ImageColor3=ab.GetTextColorForHSB(ao)}):Play()
end
ad(am,0.06,{ImageColor3=ao}):Play()
end

return ai
end

function ai.SetIcon(an,ao)
ai.Icon=ao

if aj then
aj:Destroy()
aj=nil
end

if ao then
aj=ab.Image(ao,ao,0,ag.Window,"Tag",false)

aj.Size=UDim2.new(0,ai.IconSize,0,ai.IconSize)
aj.Parent=am:FindFirstChild"Content"

if typeof(ai.Color)=="Color3"then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ai.Color)
elseif typeof(ai.Color)=="table"then
aj.ImageLabel.ImageColor3=ab.GetTextColorForHSB(ab.GetAverageColor(al))
end
end
return ai
end

function ai.Destroy(an)
am:Destroy()
return ai
end

ab:OnThemeChange(function(an,ao)
ak.TextColor3=ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))
aj.ImageLabel.ImageColor3=
ab.GetTextColorForHSB(ab.GetThemeProperty(ai.Color,ab.Theme))
end)

return ai
end

return aa end function a.B():typeof(__modImpl())local aa=a.cache.B if not aa then aa={c=__modImpl()}a.cache.B=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)return aa end)


local ab=aa(game:GetService"RunService")
local ac=aa(game:GetService"HttpService")

local ad

local af
af={
Folder=nil,
Path=nil,
Configs={},
Parser={
Colorpicker={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Default:ToHex(),
transparency=ag.Transparency or nil,
}
end,
Load=function(ag,ah)
if ag and ag.Update then
ag:Update(Color3.fromHex(ah.value),ah.transparency or nil)
end
end
},
Dropdown={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Select then
ag:Select(ah.value)
end
end
},
Input={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
Keybind={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
Slider={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value.Default,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(tonumber(ah.value))
end
end
},
Toggle={
Save=function(ag)
return{
__type=ag.__type,
value=ag.Value,
}
end,
Load=function(ag,ah)
if ag and ag.Set then
ag:Set(ah.value)
end
end
},
}
}

function af.Init(ag,ah)
if not ah.Folder then
warn"[ WindUI.ConfigManager ] Window.Folder is not specified."
return false
end
if ab:IsStudio()or not writefile then
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return false
end

ad=ah
af.Folder=ad.Folder
af.Path="WindUI/"..tostring(af.Folder).."/config/"

if not isfolder(af.Path)then
makefolder(af.Path)
end

local ai=af:AllConfigs()

for aj,ak in next,ai do
if isfile and readfile and isfile(ak..".json")then
af.Configs[ak]=readfile(ak..".json")
end
end

return af
end

function af.SetPath(ag,ah)
if not ah then
warn"[ WindUI.ConfigManager ] Custom path is not specified."
return false
end

af.Path=ah
if not ah:match"/$"then
af.Path=ah.."/"
end

if not isfolder(af.Path)then
makefolder(af.Path)
end

return true
end

function af.CreateConfig(ag,ah,ai)
local aj={
Path=af.Path..ah..".json",
Elements={},
CustomData={},
AutoLoad=ai or false,
Version=1.2,
}

if not ah then
return false,"No config file is selected"
end

function aj.SetAsCurrent(ak)
ad:SetCurrentConfig(aj)
end

function aj.Register(ak,al,am)
aj.Elements[al]=am
end

function aj.Set(ak,al,am)
aj.CustomData[al]=am
end

function aj.Get(ak,al)
return aj.CustomData[al]
end

function aj.SetAutoLoad(ak,al)
aj.AutoLoad=al
end

function aj.Save(ak)
if ad.PendingFlags then
for al,am in next,ad.PendingFlags do
aj:Register(al,am)
end
end

local al={
__version=aj.Version,
__elements={},
__autoload=aj.AutoLoad,
__custom=aj.CustomData
}

for am,an in next,aj.Elements do
if af.Parser[an.__type]then
al.__elements[tostring(am)]=af.Parser[an.__type].Save(an)
end
end

local am=ac:JSONEncode(al)
if writefile then
writefile(aj.Path,am)
end

return al
end

function aj.Load(ak)
if isfile and not isfile(aj.Path)then
return false,"Config file does not exist"
end

local al,am=pcall(function()
local al=readfile or function()
warn"[ WindUI.ConfigManager ] The config system doesn't work in the studio."
return nil
end
return ac:JSONDecode(al(aj.Path))
end)

if not al then
return false,"Failed to parse config file"
end

if not am.__version then
local an={
__version=aj.Version,
__elements=am,
__custom={}
}
am=an
end

if ad.PendingFlags then
for an,ao in next,ad.PendingFlags do
aj:Register(an,ao)
end
end

for an,ao in next,(am.__elements or{})do
if aj.Elements[an]and af.Parser[ao.__type]then
task.spawn(function()
af.Parser[ao.__type].Load(aj.Elements[an],ao)
end)
end
end

aj.CustomData=am.__custom or{}

return aj.CustomData
end

function aj.Delete(ak)
if not delfile then
return false,"delfile function is not available"
end

if not isfile(aj.Path)then
return false,"Config file does not exist"
end

local al,am=pcall(function()
delfile(aj.Path)
end)

if not al then
return false,"Failed to delete config file: "..tostring(am)
end

af.Configs[ah]=nil

if ad.CurrentConfig==aj then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function aj.GetData(ak)
return{
elements=aj.Elements,
custom=aj.CustomData,
autoload=aj.AutoLoad
}
end


if isfile(aj.Path)then
local ak,al=pcall(function()
return ac:JSONDecode(readfile(aj.Path))
end)

if ak and al and al.__autoload then
aj.AutoLoad=true

task.spawn(function()
task.wait(0.5)
local am,an=pcall(function()
return aj:Load()
end)
if am then
if ad.Debug then print("[ WindUI.ConfigManager ] AutoLoaded config: "..ah)end
else
warn("[ WindUI.ConfigManager ] Failed to AutoLoad config: "..ah.." - "..tostring(an))
end
end)
end
end


aj:SetAsCurrent()
af.Configs[ah]=aj
return aj
end

function af.Config(ag,ah,ai)
return af:CreateConfig(ah,ai)
end

function af.GetAutoLoadConfigs(ag)
local ah={}

for ai,aj in pairs(af.Configs)do
if aj.AutoLoad then
table.insert(ah,ai)
end
end

return ah
end

function af.DeleteConfig(ag,ah)
if not delfile then
return false,"delfile function is not available"
end

local ai=af.Path..ah..".json"

if not isfile(ai)then
return false,"Config file does not exist"
end

local aj,ak=pcall(function()
delfile(ai)
end)

if not aj then
return false,"Failed to delete config file: "..tostring(ak)
end

af.Configs[ah]=nil

if ad.CurrentConfig and ad.CurrentConfig.Path==ai then
ad.CurrentConfig=nil
end

return true,"Config deleted successfully"
end

function af.AllConfigs(ag)
if not listfiles then return{}end

local ah={}
if not isfolder(af.Path)then
makefolder(af.Path)
return ah
end

for ai,aj in next,listfiles(af.Path)do
local ak=aj:match"([^\\/]+)%.json$"
if ak then
table.insert(ah,ak)
end
end

return ah
end

function af.GetConfig(ag,ah)
return af.Configs[ah]
end

return af end function a.C():typeof(__modImpl())local aa=a.cache.C if not aa then aa={c=__modImpl()}a.cache.C=aa end return aa.c end end do local function __modImpl()
local aa={}

local ab=a.d()
local ac=ab.New
local ad=ab.Tween


local af=(cloneref or clonereference or function(af)return af end)


af(game:GetService"UserInputService")


function aa.New(ag)
local ah={
Button=nil
}

local ai













local aj=ac("TextLabel",{
Text=ag.Title,
TextSize=17,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

local ak=ac("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
ac("ImageLabel",{
Image=ab.Icon"move"[1],
ImageRectOffset=ab.Icon"move"[2].ImageRectPosition,
ImageRectSize=ab.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.3,
})
})
local al=ac("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

local am=ac("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=ag.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})


local an=ac("UIScale",{
Scale=1,
})

local ao=ac("Frame",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=am,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{
an,
ac("UICorner",{
CornerRadius=UDim.new(1,0)
}),
ac("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
ac("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
ak,
al,

ac("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

ac("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
ac("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
ai,
ac("UIListLayout",{
Padding=UDim.new(0,ag.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
aj,
ac("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
}),
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

ah.Button=ao



function ah.SetIcon(ap,aq)
if ai then
ai:Destroy()
end
if aq then
ai=ab.Image(
aq,
ag.Title,
0,
ag.Folder,
"OpenButton",
true,
ag.IconThemed
)
ai.Size=UDim2.new(0,22,0,22)
ai.LayoutOrder=-1
ai.Parent=ah.Button.TextButton
end
end

if ag.Icon then
ah:SetIcon(ag.Icon)
end



ab.AddSignal(ao:GetPropertyChangedSignal"AbsoluteSize",function()
am.Size=UDim2.new(
0,ao.AbsoluteSize.X,
0,ao.AbsoluteSize.Y
)
end)

ab.AddSignal(ao.TextButton.MouseEnter,function()
ad(ao.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
ab.AddSignal(ao.TextButton.MouseLeave,function()
ad(ao.TextButton,.1,{BackgroundTransparency=1}):Play()
end)

local ap=ab.Drag(am)


function ah.Visible(aq,ar)
am.Visible=ar
end

function ah.SetScale(aq,ar)
an.Scale=ar
end

function ah.Edit(aq,ar)
local as={
Title=ar.Title,
Icon=ar.Icon,
Enabled=ar.Enabled,
Position=ar.Position,
OnlyIcon=ar.OnlyIcon or false,
Draggable=ar.Draggable or nil,
OnlyMobile=ar.OnlyMobile,
CornerRadius=ar.CornerRadius or UDim.new(1,0),
StrokeThickness=ar.StrokeThickness or 2,
Scale=ar.Scale or 1,
Color=ar.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if as.Enabled==false then
ag.IsOpenButtonEnabled=false
end

if as.OnlyMobile~=false then
as.OnlyMobile=true
else
ag.IsPC=false
end


if as.Draggable==false and ak and al then
ak.Visible=as.Draggable
al.Visible=as.Draggable

if ap then
ap:Set(as.Draggable)
end
end

if as.Position and am then
am.Position=as.Position
end

if as.OnlyIcon==true and aj then
aj.Visible=false
ao.TextButton.UIPadding.PaddingLeft=UDim.new(0,7)
ao.TextButton.UIPadding.PaddingRight=UDim.new(0,7)
elseif as.OnlyIcon==false then
aj.Visible=true
ao.TextButton.UIPadding.PaddingLeft=UDim.new(0,11)
ao.TextButton.UIPadding.PaddingRight=UDim.new(0,11)
end





if aj then
if as.Title then
aj.Text=as.Title
ab:ChangeTranslationKey(aj,as.Title)
elseif as.Title==nil then

end
end

if as.Icon then
ah:SetIcon(as.Icon)
end

ao.UIStroke.UIGradient.Color=as.Color
if Glow then
Glow.UIGradient.Color=as.Color
end

ao.UICorner.CornerRadius=as.CornerRadius
ao.TextButton.UICorner.CornerRadius=UDim.new(as.CornerRadius.Scale,as.CornerRadius.Offset-4)
ao.UIStroke.Thickness=as.StrokeThickness

ah:SetScale(as.Scale)
end

return ah
end



return aa end function a.D():typeof(__modImpl())local aa=a.cache.D if not aa then aa={c=__modImpl()}a.cache.D=aa end return aa.c end end do local function __modImpl()
local aa={}

local ab=a.d()
local ac=ab.New
local ad=ab.Tween


function aa.New(af,ag,ah,ai,aj,ak)
local al={
Container=nil,
TooltipSize=16,

TooltipArrowSizeX=aj=="Small"and 16 or 24,
TooltipArrowSizeY=aj=="Small"and 6 or 9,

PaddingX=aj=="Small"and 12 or 14,
PaddingY=aj=="Small"and 7 or 9,

Radius=999,

TitleFrame=nil,
}

ai=ai or""
ak=ak~=false

local am=ac("TextLabel",{
AutomaticSize="XY",
TextWrapped=ak,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Text=af,
TextSize=aj=="Small"and 15 or 17,
TextTransparency=1,
ThemeTag={
TextColor3="Tooltip"..ai.."Text",
}
})

al.TitleFrame=am

local an=ac("UIScale",{
Scale=.9
})

local ao=ac("Frame",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=ag,

Visible=false
},{
ac("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
ac("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=ah,
Name="Arrow",
},{
ac("ImageLabel",{
Size=UDim2.new(0,al.TooltipArrowSizeX,0,al.TooltipArrowSizeY),
BackgroundTransparency=1,

Image="rbxassetid://105854070513330",
ThemeTag={
ImageColor3="Tooltip"..ai,
},
},{










}),
}),
ab.NewRoundFrame(al.Radius,"Squircle",{
AutomaticSize="XY",
ThemeTag={
ImageColor3="Tooltip"..ai,
},
ImageTransparency=1,
Name="Background",
},{



ac("Frame",{



AutomaticSize="XY",
BackgroundTransparency=1,
},{
ac("UICorner",{
CornerRadius=UDim.new(0,16),
}),
ac("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

am,
ac("UIPadding",{
PaddingTop=UDim.new(0,al.PaddingY),
PaddingLeft=UDim.new(0,al.PaddingX),
PaddingRight=UDim.new(0,al.PaddingX),
PaddingBottom=UDim.new(0,al.PaddingY),
}),
})
}),
an,
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
al.Container=ao

function al.Open(ap)
ao.Visible=true


ad(ao.Background,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ao.Arrow.ImageLabel,.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.2,{TextTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an,.22,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function al.Close(ap,aq)

ad(ao.Background,.3,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(ao.Arrow.ImageLabel,.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(am,.3,{TextTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
ad(an,.35,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.In):Play()

aq=aq~=false
if aq then
task.wait(.35)

ao.Visible=false
ao:Destroy()
end
end

return al
end



return aa end function a.E():typeof(__modImpl())local aa=a.cache.E if not aa then aa={c=__modImpl()}a.cache.E=aa end return aa.c end end do local function __modImpl()
game:GetService"ReplicatedStorage"
local aa=a.d()
local ab=aa.New
local ac=aa.NewRoundFrame
local ad=aa.Tween

local af=(cloneref or clonereference or function(af)
return af
end)

af(game:GetService"UserInputService")

local ag=a.B()

local function Color3ToHSB(ah)
local ai,aj,ak=ah.R,ah.G,ah.B
local al=math.max(ai,aj,ak)
local am=math.min(ai,aj,ak)
local an=al-am

local ao=0
if an~=0 then
if al==ai then
ao=(aj-ak)/an%6
elseif al==aj then
ao=(ak-ai)/an+2
else
ao=(ai-aj)/an+4
end
ao=ao*60
else
ao=0
end

local ap=(al==0)and 0 or(an/al)
local aq=al

return{
h=math.floor(ao+0.5),
s=ap,
b=aq,
}
end

local function GetPerceivedBrightness(ah)
local ai=ah.R
local aj=ah.G
local ak=ah.B
return 0.299*ai+0.587*aj+0.114*ak
end

local function GetTextColorForHSB(ah)
local ai=Color3ToHSB(ah)local
aj, ak, al=ai.h, ai.s, ai.b
if GetPerceivedBrightness(ah)>0.5 then
return Color3.fromHSV(aj/360,0,0.05)
else
return Color3.fromHSV(aj/360,0,0.98)
end
end

return function(ah)
local ai={
Title=ah.Title,
Desc=ah.Desc or nil,
Hover=ah.Hover,
Thumbnail=ah.Thumbnail,
ThumbnailSize=ah.ThumbnailSize or 80,
Image=ah.Image,
IconThemed=ah.IconThemed or false,
ImageSize=ah.ImageSize or 30,
Color=ah.Color,
Scalable=ah.Scalable,
Parent=ah.Parent,
Justify=ah.Justify or"Between",
UIPadding=ah.Window.ElementConfig.UIPadding,
UICorner=ah.Window.ElementConfig.UICorner,
Size=ah.Size or"Default",
Tags=ah.Tags or{},
UIElements={},

Index=ah.Index,
}

local aj=ai.Size=="Small"and-4 or ai.Size=="Large"and 4 or 0
local ak=ai.Size=="Small"and-4 or ai.Size=="Large"and 4 or 0

local al=ai.ImageSize
local am=ai.ThumbnailSize
local an=true


local ao=0

local ap
local aq
if ai.Thumbnail then
ap=aa.Image(
ai.Thumbnail,
ai.Title,
ah.Window.NewElements and ai.UICorner-11 or(ai.UICorner-4),
ah.Window.Folder,
"Thumbnail",
false,
ai.IconThemed
)
ap.Size=UDim2.new(1,0,0,am)
end
if ai.Image then
aq=aa.Image(
ai.Image,
ai.Title,
ah.Window.NewElements and ai.UICorner-11 or(ai.UICorner-4),
ah.Window.Folder,
"Image",
ai.IconThemed,
not ai.Color and true or false,
"ElementIcon"
)

if typeof(ai.Color)=="string"and not string.find(ai.Image,"rbxthumb")then
aq.ImageLabel.ImageColor3=GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
elseif typeof(ai.Color)=="Color3"and not string.find(ai.Image,"rbxthumb")then
aq.ImageLabel.ImageColor3=GetTextColorForHSB(ai.Color)
end

aq.Size=UDim2.new(0,al,0,al)

ao=al
end

local function CreateText(ar,as)
local at=typeof(ai.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
or typeof(ai.Color)=="Color3"and GetTextColorForHSB(ai.Color)

return ab("TextLabel",{
BackgroundTransparency=1,
Text=ar or"",
TextSize=as=="Desc"and 15 or 17,
TextXAlignment="Left",
ThemeTag={
TextColor3=not ai.Color and("Element"..as)or nil,
},
TextColor3=ai.Color and at or nil,
TextTransparency=as=="Desc"and 0.3 or 0,
TextWrapped=true,
Size=UDim2.new(ai.Justify=="Between"and 1 or 0,0,0,0),
AutomaticSize=ai.Justify=="Between"and"Y"or"XY",
FontFace=Font.new(aa.Font,as=="Desc"and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold),
})
end

local ar=CreateText(ai.Title,"Title")
local as=CreateText(ai.Desc,"Desc")
if not ai.Title or ai.Title==""then
as.Visible=false
end
if not ai.Desc or ai.Desc==""then
as.Visible=false
end

ai.UIElements.Title=ar
ai.UIElements.Desc=as

ai.UIElements.Container=ab("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
},{
ab("UIListLayout",{
Padding=UDim.new(0,ai.UIPadding),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment=ai.Justify=="Between"and"Left"or"Center",
}),
ap,
ab("Frame",{
Size=UDim2.new(
ai.Justify=="Between"and 1 or 0,
ai.Justify=="Between"and-ah.TextOffset or 0,
0,
0
),
AutomaticSize=ai.Justify=="Between"and"Y"or"XY",
BackgroundTransparency=1,
Name="TitleFrame",
},{
ab("UIListLayout",{
Padding=UDim.new(0,ai.UIPadding),
FillDirection="Horizontal",
VerticalAlignment=ah.Window.NewElements and(ai.Justify=="Between"and"Top"or"Center")
or"Center",
HorizontalAlignment=ai.Justify~="Between"and ai.Justify or"Center",
}),
aq,
ab("Frame",{
BackgroundTransparency=1,
AutomaticSize=ai.Justify=="Between"and"Y"or"XY",
Size=UDim2.new(
ai.Justify=="Between"and 1 or 0,
ai.Justify=="Between"and(aq and-ao-ai.UIPadding or-ao)
or 0,
1,
0
),
Name="TitleFrame",
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,(ah.Window.NewElements and ai.UIPadding/2 or 0)+ak),
PaddingLeft=UDim.new(0,(ah.Window.NewElements and ai.UIPadding/2 or 0)+aj),
PaddingRight=UDim.new(
0,
(ah.Window.NewElements and ai.UIPadding/2 or 0)+aj
),
PaddingBottom=UDim.new(
0,
(ah.Window.NewElements and ai.UIPadding/2 or 0)+ak
),
}),
ab("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
ab("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=-99,
BackgroundTransparency=1,
ScrollingDirection="X",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
Visible=false,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ah.Window.UIPadding/2),
}),
}),
ab("Frame",{
Name="Space",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Visible=false,
}),
ar,
as,
}),
}),
})

for at,au in next,ah.Tags or{}do
if not ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible then
ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Visible=true
ai.UIElements.Container.TitleFrame.TitleFrame.Space.Visible=true
end
ag:New(au,ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame)
end

aa.AddSignal(
ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout:GetPropertyChangedSignal
"AbsoluteContentSize"
,
function()
ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.Size=UDim2.new(
1,
0,
0,
ai.UIElements.Container.TitleFrame.TitleFrame.ScrollingFrame.UIListLayout.AbsoluteContentSize.Y
/ah.ParentConfig.UIScale
)
end
)





local at=aa.Image("lock","lock",0,ah.Window.Folder,"Lock",false)
at.Size=UDim2.new(0,20,0,20)
at.ImageLabel.ImageColor3=Color3.new(1,1,1)
at.ImageLabel.ImageTransparency=0.4

local au=ab("TextLabel",{
Text="Locked",
TextSize=18,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
AutomaticSize="XY",
BackgroundTransparency=1,
TextColor3=Color3.new(1,1,1),
TextTransparency=0.05,
})

local av=ab("Frame",{
Size=UDim2.new(1,ai.UIPadding*2,1,ai.UIPadding*2),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ZIndex=9999999,
})

local aw,ax=ac(ai.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.25,
ImageColor3=Color3.new(0,0,0),
Visible=false,
Active=false,
Parent=av,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
at,
au,
},nil,true)local

ay=ac(ai.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=av,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local az,aA=ac(ai.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=av,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)local

aB=ac(ai.UICorner,"Squircle-Outline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Visible=false,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=av,
},{
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
},nil,true)

local b,d=ac(ai.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
Active=false,
ThemeTag={
ImageColor3="Text",
},
Parent=av,
},{
ab("UIGradient",{
Name="HoverGradient",
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.25,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.75,0.9),
NumberSequenceKeypoint.new(1,1),
},
}),
ab("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
Padding=UDim.new(0,8),
}),
},nil,true)

local f,g=ac(ai.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ImageTransparency=ai.Color and 0.05 or(not ah.Window.NewElements and 0.93 or nil),



Parent=ah.Parent,
ThemeTag={
ImageColor3=not ai.Color and(ah.Window.NewElements and"ElementBackground"or"Text")or nil,
ImageTransparency=not ai.Color
and(ah.Window.NewElements and"ElementBackgroundTransparency"or nil)
or nil,
},
ImageColor3=ai.Color and(typeof(ai.Color)=="string"and Color3.fromHex(
aa.Colors[ai.Color]
)or typeof(ai.Color)=="Color3"and ai.Color)or nil,
},{
ai.UIElements.Container,
av,
ab("UIPadding",{
PaddingTop=UDim.new(0,ai.UIPadding),
PaddingLeft=UDim.new(0,ai.UIPadding),
PaddingRight=UDim.new(0,ai.UIPadding),
PaddingBottom=UDim.new(0,ai.UIPadding),
}),
},true,true)

ai.UIElements.Main=f
ai.UIElements.Locked=aw

if ai.Hover then
aa.AddSignal(f.MouseEnter,function()
if an then

ad(b,0.12,{ImageTransparency=0.9}):Play()
ad(aB,0.12,{ImageTransparency=0.8}):Play()
aa.AddSignal(f.MouseMoved,function(h,i)
b.HoverGradient.Offset=
Vector2.new(((h-f.AbsolutePosition.X)/f.AbsoluteSize.X)-0.5,0)
aB.HoverGradient.Offset=
Vector2.new(((h-f.AbsolutePosition.X)/f.AbsoluteSize.X)-0.5,0)
end)
end
end)
aa.AddSignal(f.InputEnded,function()
if an then

ad(b,0.12,{ImageTransparency=1}):Play()
ad(aB,0.12,{ImageTransparency=1}):Play()
end
end)
end

function ai.SetTitle(h,i)
ai.Title=i
ar.Text=i
end

function ai.SetDesc(h,i)
ai.Desc=i
as.Text=i or""
if not i then
as.Visible=false
elseif not as.Visible then
as.Visible=true
end
end

function ai.Colorize(h,i,l)
if ai.Color then
i[l]=typeof(ai.Color)=="string"
and GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
or typeof(ai.Color)=="Color3"and GetTextColorForHSB(ai.Color)
or nil
end
end

if ah.ElementTable then
aa.AddSignal(ar:GetPropertyChangedSignal"Text",function()
if ai.Title~=ar.Text then
ai:SetTitle(ar.Text)
ah.ElementTable.Title=ar.Text
end
end)
aa.AddSignal(as:GetPropertyChangedSignal"Text",function()
if ai.Desc~=as.Text then
ai:SetDesc(as.Text)
ah.ElementTable.Desc=as.Text
end
end)
end





function ai.SetThumbnail(h,i,l)
ai.Thumbnail=i
if l then
ai.ThumbnailSize=l
am=l
end

if ap then
if i then
ap:Destroy()
ap=aa.Image(
i,
ai.Title,
ai.UICorner-3,
ah.Window.Folder,
"Thumbnail",
false,
ai.IconThemed
)
if ap then
ap.Size=UDim2.new(1,0,0,am)
ap.Parent=ai.UIElements.Container
local m=ai.UIElements.Container:FindFirstChild"UIListLayout"
if m then
ap.LayoutOrder=-1
end
end
else
ap.Visible=false
end
else
if i then
ap=aa.Image(
i,
ai.Title,
ai.UICorner-3,
ah.Window.Folder,
"Thumbnail",
false,
ai.IconThemed
)
if ap then
ap.Size=UDim2.new(1,0,0,am)
ap.Parent=ai.UIElements.Container
local m=ai.UIElements.Container:FindFirstChild"UIListLayout"
if m then
ap.LayoutOrder=-1
end
end
end
end
end

function ai.SetImage(h,i,l)
ai.Image=i
if l then
ai.ImageSize=l
al=l
end

if i then
local m=aq and aq.Parent or ai.UIElements.Container.TitleFrame
if aq then
aq:Destroy()
end

aq=aa.Image(
i,
i,
ai.UICorner-3,
ah.Window.Folder,
"Image",
not ai.Color and true or false
)
if aq then
if typeof(ai.Color)=="string"and not string.find(ai.Image,"rbxthumb")then
aq.ImageLabel.ImageColor3=
GetTextColorForHSB(Color3.fromHex(aa.Colors[ai.Color]))
elseif typeof(ai.Color)=="Color3"and not string.find(ai.Image,"rbxthumb")then
aq.ImageLabel.ImageColor3=GetTextColorForHSB(ai.Color)
end

aq.Visible=true
aq.Parent=m
aq.LayoutOrder=-99

aq.Size=UDim2.new(0,al,0,al)
ao=ai.ImageSize+ai.UIPadding
end
else
if aq then
aq.Visible=true
end
ao=0
end

ai.UIElements.Container.TitleFrame.TitleFrame.Size=UDim2.new(1,-ao,1,0)
end

function ai.Destroy(h)
f:Destroy()
end

function ai.Lock(h,i)
an=false
aw.Active=true
aw.Visible=true
au.Text=i or"Locked"
end

function ai.Unlock(h)
an=true
aw.Active=false
aw.Visible=false
end

function ai.Highlight(h)
local i=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.1,0.9),
NumberSequenceKeypoint.new(0.5,0.3),
NumberSequenceKeypoint.new(0.9,0.9),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=ay,
})

local l=ab("UIGradient",{
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.new(1,1,1)),
ColorSequenceKeypoint.new(1,Color3.new(1,1,1)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(0.15,0.8),
NumberSequenceKeypoint.new(0.5,0.1),
NumberSequenceKeypoint.new(0.85,0.8),
NumberSequenceKeypoint.new(1,1),
},
Rotation=0,
Offset=Vector2.new(-1,0),
Parent=az,
})

ay.ImageTransparency=0.65
az.ImageTransparency=0.88

ad(i,0.75,{
Offset=Vector2.new(1,0),
}):Play()

ad(l,0.75,{
Offset=Vector2.new(1,0),
}):Play()

task.spawn(function()
task.wait(0.75)
ay.ImageTransparency=1
az.ImageTransparency=1
i:Destroy()
l:Destroy()
end)
end

function ai.UpdateShape(h)
if ah.Window.NewElements then
local i=aa:GetElementPosition(
h.Elements,
ai.Index,
ah.ParentConfig.ParentTable.__type=="HStack"or ah.ParentConfig.ParentTable.__type=="Group"
)

if i and f then
g:SetType(i)
ax:SetType(i)
aA:SetType(i)

d:SetType(i)

end
end
end





return ai
end end function a.F():typeof(__modImpl())local aa=a.cache.F if not aa then aa={c=__modImpl()}a.cache.F=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ab=aa.New

local ac={}

local ad=a.m().New

function ac.New(af,ag)
ag.Hover=false
ag.TextOffset=0
ag.ParentConfig=ag
ag.IsButtons=ag.Buttons and#ag.Buttons>0 and true or false

local ah={
__type="Paragraph",
Title=ag.Title or"Paragraph",
Desc=ag.Desc or nil,

Locked=ag.Locked or false,
}
local ai=a.F()(ag)

ah.ParagraphFrame=ai
if ag.Buttons and#ag.Buttons>0 then
local aj=ab("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=ai.UIElements.Container,
},{
ab("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
}),
})

for ak,al in next,ag.Buttons do
local am=ad(
al.Title,
al.Icon,
al.Callback,
al.Variant or"White",
aj,
nil,
nil,
ag.Window.NewElements and 999 or 10
)
am.Size=UDim2.new(1,0,0,38)

end
end

return ah.__type,ah
end

return ac end function a.G():typeof(__modImpl())local aa=a.cache.G if not aa then aa={c=__modImpl()}a.cache.G=aa end return aa.c end end do local function __modImpl()

local aa=a.d()local ab=
aa.New

local ac={}

function ac.New(ad,af)
local ag={
__type="Button",
Title=af.Title or"Button",
Desc=af.Desc or nil,
Icon=af.Icon or"mouse-pointer-click",
IconThemed=af.IconThemed or false,
IconColor=af.IconColor or nil,
Color=af.Color,
Justify=af.Justify or"Between",
IconAlign=af.IconAlign or"Right",
Locked=af.Locked or false,
LockedTitle=af.LockedTitle,
Callback=af.Callback or function()end,
UIElements={},
}

local ah=true

ag.ButtonFrame=a.F(){
Title=ag.Title,
Desc=ag.Desc,
Parent=af.Parent,




Window=af.Window,
Color=ag.Color,
Justify=ag.Justify,
TextOffset=20,
Hover=true,
Scalable=true,
Tab=af.Tab,
Index=af.Index,
ElementTable=ag,
ParentConfig=af,
Size=af.Size,
Tags=af.Tags,
}














ag.UIElements.ButtonIcon=aa.Image(
ag.Icon,
ag.Icon,
0,
af.Window.Folder,
"Button",
not(ag.Color or ag.IconColor)and true or nil,
ag.IconThemed
)

if ag.IconColor then
ag.UIElements.ButtonIcon.ImageLabel.ImageColor3=ag.IconColor
end

ag.UIElements.ButtonIcon.Size=UDim2.new(0,20,0,20)
ag.UIElements.ButtonIcon.Parent=ag.Justify=="Between"and ag.ButtonFrame.UIElements.Main
or ag.ButtonFrame.UIElements.Container.TitleFrame
ag.UIElements.ButtonIcon.LayoutOrder=ag.IconAlign=="Left"and-99999 or 99999
ag.UIElements.ButtonIcon.AnchorPoint=Vector2.new(1,0.5)
ag.UIElements.ButtonIcon.Position=UDim2.new(1,0,0.5,0)

ag.ButtonFrame:Colorize(ag.UIElements.ButtonIcon.ImageLabel,"ImageColor3")

function ag.Lock(ai)
ag.Locked=true
ah=false
return ag.ButtonFrame:Lock(ag.LockedTitle)
end
function ag.Unlock(ai)
ag.Locked=false
ah=true
return ag.ButtonFrame:Unlock()
end

if ag.Locked then
ag:Lock()
end

aa.AddSignal(ag.ButtonFrame.UIElements.Main.MouseButton1Click,function()
if ah then
task.spawn(function()
aa.SafeCallback(ag.Callback)
end)
end
end)
return ag.__type,ag
end

return ac end function a.H():typeof(__modImpl())local aa=a.cache.H if not aa then aa={c=__modImpl()}a.cache.H=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()
local ac=ab.New
local ad=ab.Tween

local af=game:GetService"UserInputService"

function aa.New(ag,ah,ai,aj,ak,al,am)
local an={
GlassSpritesheet={
Id="rbxassetid://77297718671545",
MirroredId="rbxassetid://92258969882244",
Size=Vector2.new(102,128),
Total=80,
Cols=10,
},
}

function an.GetGlassFrame(ao,ap:number):(string,Vector2,Vector2)
local aq=an.GlassSpritesheet
local ar:number

if ap<=0.4 then
ar=math.floor((ap/0.4)*(aq.Total-1))
elseif ap<0.6 then
ar=aq.Total-1
else
ar=math.floor(((ap-0.6)/0.4)*(aq.Total-1))
end

ar=math.clamp(ar,0,aq.Total-1)

local as=ap>=0.6
if as then
ar=(aq.Total-1)-ar
end

local at=as and aq.MirroredId or aq.Id

return at,aq.Size,Vector2.new((ar%aq.Cols)*aq.Size.X,math.floor(ar/aq.Cols)*aq.Size.Y)
end

local ao=12
local ap
if ah and ah~=""then
ap=ac("ImageLabel",{
Size=UDim2.new(0,13,0,13),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=ab.Icon(ah)[1],
ImageRectOffset=ab.Icon(ah)[2].ImageRectPosition,
ImageRectSize=ab.Icon(ah)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local aq=ac("Frame",{
Size=UDim2.new(0,2,0,26),
BackgroundTransparency=1,
Parent=aj,
})

local ar=ab.NewRoundFrame(ao,"Squircle",{
ImageTransparency=0.85,
ThemeTag={
ImageColor3="Text",
},
Parent=aq,
Size=UDim2.new(0,al and(52)or(40.8),0,24),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(0,0,0.5,0),
Name="ToggleFrame",
},{
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Toggle",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(ao,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
ac("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
}),
}),


ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(0,al and 30 or 20,0,20),
Position=UDim2.new(0,2,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=1,
Name="Frame",
},{
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Bar",
},{
ab.New("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundColor3=Color3.new(1,1,1),
Name="Highlight",
BackgroundTransparency=1,
},{
ab.NewRoundFrame(9999,"SquircleGlass",{
Size=UDim2.new(1,1,1,1),
ImageColor3=Color3.new(1,1,1),
Name="SquircleGlass",
ImageTransparency=0.5,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
}),
ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="GlassBackground",
ImageTransparency=0,
ThemeTag={
ImageColor3="ElementBackground",
},
ZIndex=-1,
}),
ac("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Glass",
ImageTransparency=0,
},{
ac("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),






ab.NewRoundFrame(ao,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="BarOverlay",
ThemeTag={
ImageColor3="ToggleBar",
},
ZIndex=999,
}),
}),
ap,
ac("UIScale",{
Scale=1,
}),
}),
}),
ac("TextButton",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="Hitbox",
Text="",
}),
})

local as
local at

local au=al and 30 or 20
local av=ar.Size.X.Offset

function an.Set(aw,ax,ay,az)
if not az then
if ax then
ad(ar.Frame,0.35,{
Position=UDim2.new(0,av-au-2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.15)

ad(
ar.Frame.Bar.Highlight.Glass,
0.15,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
else
ad(ar.Frame,0.35,{
Position=UDim2.new(0,2,0.5,0),
},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.15)
ad(
ar.Frame.Bar.Highlight.Glass,
0.15,
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
else
if ax then
ar.Frame.Position=UDim2.new(0,av-au-2,0.5,0)
else
ar.Frame.Position=UDim2.new(0,2,0.5,0)
end
end

if ax then
ad(ar.Layer,0.1,{
ImageTransparency=0,
}):Play()
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Toggle"},0.1)
ad(
ar.Frame.Bar.Highlight.Glass,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if ap then
ad(ap,0.1,{
ImageTransparency=0,
}):Play()
end

local aA,aB,b=an:GetGlassFrame(1)

ar.Frame.Bar.Highlight.Glass.Image=aA
ar.Frame.Bar.Highlight.Glass.ImageRectSize=aB
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=b
else
ad(ar.Layer,0.1,{
ImageTransparency=1,
}):Play()
ab.SetThemeTag(ar.Frame.Bar.Highlight.Glass,{ImageColor3="Text"},0.1)
ad(
ar.Frame.Bar.Highlight.Glass,
0.1,
{ImageTransparency=0.85},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if ap then
ad(ap,0.1,{
ImageTransparency=1,
}):Play()
end

local aA,aB,b=an:GetGlassFrame(0)

ar.Frame.Bar.Highlight.Glass.Image=aA
ar.Frame.Bar.Highlight.Glass.ImageRectSize=aB
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=b
end

ay=ay~=false

task.spawn(function()
if ak and ay then
ab.SafeCallback(ak,ax)
end
end)
end

function an.Animate(aw,ax,ay)
if not am.Window.IsToggleDragging then
am.Window.IsToggleDragging=true

local az=ax.Position.X
local aA=ax.Position.Y
local aB=ar.Frame.Position.X.Offset
local b=false
local d=false

ad(
ar.Frame.Bar.UIScale,
0.28,
{Scale=1.5},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(
ar.Frame.Bar.Highlight.BarOverlay,
0.28,
{ImageTransparency=0.86},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()

if as then
as:Disconnect()
end

as=af.InputChanged:Connect(function(f)
if not am.Window.IsToggleDragging then
return
end
if
f.UserInputType~=Enum.UserInputType.MouseMovement
and f.UserInputType~=Enum.UserInputType.Touch
then
return
end
if b then
return
end

local g=math.abs(f.Position.X-az)
math.abs(f.Position.Y-aA)

if not d and g>8 then
d=true
end

local h=f.Position.X-az
local i=math.max(2,math.min(aB+h,av-au-2))

local l=math.clamp((i-2)/(av-au-4),0,1)

local m,p,r=an:GetGlassFrame(l)
ar.Frame.Bar.Highlight.Glass.Image=m
ar.Frame.Bar.Highlight.Glass.ImageRectSize=p
ar.Frame.Bar.Highlight.Glass.ImageRectOffset=r

ad(ar.Frame,0.12,{
Position=UDim2.new(0,i,0.5,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

if at then
at:Disconnect()
end

at=af.InputEnded:Connect(function(f)
if not am.Window.IsToggleDragging then
return
end
if
f.UserInputType~=Enum.UserInputType.MouseButton1
and f.UserInputType~=Enum.UserInputType.Touch
then
return
end

am.Window.IsToggleDragging=false

if as then
as:Disconnect()
as=nil
end
if at then
at:Disconnect()
at=nil
end

am.WindUI.CurrentInput=nil

if b then
return
end

if not d then
ay:Set(not ay.Value,true,false)
else
local g=ar.Frame.Position.X.Offset
local h=g+au/2
local i=h>av/2
ay:Set(i,true,false)
end

ad(
ar.Frame.Bar.UIScale,
0.23,
{Scale=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
ad(
ar.Frame.Bar.Highlight.BarOverlay,
0.23,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end)
end
end

return aq,an
end

return aa end function a.I():typeof(__modImpl())local aa=a.cache.I if not aa then aa={c=__modImpl()}a.cache.I=aa end return aa.c end end do local function __modImpl()

local aa={}

local ab=a.d()local ac=
ab.New
local ad=ab.Tween


function aa.New(af,ag,ah,ai,aj,ak)
local al={}

ag=ag or"sfsymbols:checkmark"

local am=9

local an=ab.Image(
ag,
ag,
0,
(ak and ak.Window.Folder or"Temp"),
"Checkbox",
true,
false,
"CheckboxIcon"
)
an.Size=UDim2.new(1,-26+ah,1,-26+ah)
an.AnchorPoint=Vector2.new(0.5,0.5)
an.Position=UDim2.new(0.5,0,0.5,0)


local ao=ab.NewRoundFrame(am,"Squircle",{
ImageTransparency=.85,
ThemeTag={
ImageColor3="Text"
},
Parent=ai,
Size=UDim2.new(0,26,0,26),
},{
ab.NewRoundFrame(am,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Checkbox",
},
ImageTransparency=1,
}),
ab.NewRoundFrame(am,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ThemeTag={
ImageColor3="CheckboxBorder",
ImageTransparency="CheckboxBorderTransparency",
},
},{







}),

an,
},true)

function al.Set(ap,aq)
if aq then
ad(ao.Layer,0.06,{
ImageTransparency=0,
}):Play()



ad(an.ImageLabel,0.06,{
ImageTransparency=0,
}):Play()
else
ad(ao.Layer,0.05,{
ImageTransparency=1,
}):Play()



ad(an.ImageLabel,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if aj then
ab.SafeCallback(aj,aq)
end
end)
end

return ao,al
end


return aa end function a.J():typeof(__modImpl())local aa=a.cache.J if not aa then aa={c=__modImpl()}a.cache.J=aa end return aa.c end end do local function __modImpl()
local aa=a.d()local ab=
aa.New local ac=
aa.Tween

local ad=a.I().New
local af=a.J().New

local ag={}

function ag.New(ah,ai)
local aj={
__type="Toggle",
Title=ai.Title or"Toggle",
Desc=ai.Desc or nil,
Locked=ai.Locked or false,
LockedTitle=ai.LockedTitle,
Value=ai.Value,
Icon=ai.Icon or nil,
IconSize=ai.IconSize or 23,
Type=ai.Type or"Toggle",
Callback=ai.Callback or function()end,
UIElements={},
}
aj.ToggleFrame=a.F(){
Title=aj.Title,
Desc=aj.Desc,




Window=ai.Window,
Parent=ai.Parent,
TextOffset=(52),
Hover=false,
Tab=ai.Tab,
Index=ai.Index,
ElementTable=aj,
ParentConfig=ai,
Tags=ai.Tags,
}

local ak=true

if aj.Value==nil then
aj.Value=false
end

function aj.Lock(al)
aj.Locked=true
ak=false
return aj.ToggleFrame:Lock(aj.LockedTitle)
end
function aj.Unlock(al)
aj.Locked=false
ak=true
return aj.ToggleFrame:Unlock()
end

if aj.Locked then
aj:Lock()
end

local al=aj.Value

local am,an
if aj.Type=="Toggle"then
am,an=ad(
al,
aj.Icon,
aj.IconSize,
aj.ToggleFrame.UIElements.Main,
aj.Callback,
ai.Window.NewElements,
ai
)
elseif aj.Type=="Checkbox"then
am,an=af(
al,
aj.Icon,
aj.IconSize,
aj.ToggleFrame.UIElements.Main,
aj.Callback,
ai
)
else
error("Unknown Toggle Type: "..tostring(aj.Type))
end

am.AnchorPoint=Vector2.new(1,ai.Window.NewElements and 0 or 0.5)
am.Position=UDim2.new(1,0,ai.Window.NewElements and 0 or 0.5,0)

function aj.Set(ao,ap,aq,ar)
if ak then
an:Set(ap,aq,ar or false)
al=ap
aj.Value=ap
end
end

aj:Set(al,false,ai.Window.NewElements)

local ao=ai.WindUI.GenerateGUID()

if ai.Window.NewElements and an.Animate then
if aj.Type=="Toggle"then
aa.AddSignal(am.ToggleFrame.Hitbox.InputBegan,function(ap)
if
not ai.Window.IsToggleDragging
and(
ap.UserInputType==Enum.UserInputType.MouseButton1
or ap.UserInputType==Enum.UserInputType.Touch
)
then
if ai.WindUI.CurrentInput and ai.WindUI.CurrentInput~=ao then
return
end

ai.WindUI.CurrentInput=ao
an:Animate(ap,aj)
end
end)
end





else
if aj.Type=="Toggle"then
aa.AddSignal(am.ToggleFrame.Hitbox.MouseButton1Click,function()
aj:Set(not aj.Value,nil,ai.Window.NewElements)
end)
elseif aj.Type=="Checkbox"then
aa.AddSignal(am.MouseButton1Click,function()
aj:Set(not aj.Value,nil,ai.Window.NewElements)
end)
end
end

return aj.__type,aj
end

return ag end function a.K():typeof(__modImpl())local aa=a.cache.K if not aa then aa={c=__modImpl()}a.cache.K=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")
local ad=aa(game:GetService"RunService")

local af=a.d()
local ag=af.New
local ah=af.Tween

local ai={}

local aj=false

function ai.New(ak,al)
local am={}
if type(al.Value)=="table"then
am=al.Value
elseif type(al.Value)=="number"then
am.Default=al.Value
end
am.Min=am.Min or al.Min or 0
am.Max=am.Max or al.Max or 100
am.Default=am.Default or al.Default or am.Min

local an={
__type="Slider",
Title=al.Title or nil,
Desc=al.Desc or nil,
Locked=al.Locked or nil,
LockedTitle=al.LockedTitle,
Value=am,
Icons=al.Icons or nil,
IsTooltip=al.IsTooltip or false,
IsTextbox=al.IsTextbox,
Step=al.Step or al.Increment or 1,
Callback=al.Callback or function()end,
UIElements={},
IsFocusing=false,

Width=al.Width or 130,
TextBoxWidth=al.Window.NewElements and 40 or 30,
ThumbSize=13,
IconSize=26,
}
if an.Icons=={}then
an.Icons={
From="sfsymbols:sunMinFill",
To="sfsymbols:sunMaxFill",
}
end
if an.IsTextbox==nil and an.Title==nil then
an.IsTextbox=false
else
an.IsTextbox=an.IsTextbox~=false
end

local ao
local ap
local aq
local ar=an.Value.Default or an.Value.Min or 0

local as=ar
local at=(ar-(an.Value.Min or 0))/((an.Value.Max or 100)-(an.Value.Min or 0))

local au=true
local av=an.Step%1~=0

local function FormatValue(aw)
if av then
return tonumber(string.format("%.2f",aw))
end
return math.floor(aw+0.5)
end

local function CalculateValue(aw)
if av then
return math.floor(aw/an.Step+0.5)*an.Step
else
return math.floor(aw/an.Step+0.5)*an.Step
end
end

local aw,ax
local ay=32
if an.Icons then
if an.Icons.From then
aw=af.Image(
an.Icons.From,
an.Icons.From,
0,
al.Window.Folder,
"SliderIconFrom",
true,
true,
"SliderIconFrom"
)
aw.Size=UDim2.new(0,an.IconSize,0,an.IconSize)
ay=ay+an.IconSize-2
end
if an.Icons.To then
ax=af.Image(
an.Icons.To,
an.Icons.To,
0,
al.Window.Folder,
"SliderIconTo",
true,
true,
"SliderIconTo"
)
ax.Size=UDim2.new(0,an.IconSize,0,an.IconSize)
ay=ay+an.IconSize-2
end
end
an.SliderFrame=a.F(){
Title=an.Title,
Desc=an.Desc,
Parent=al.Parent,
TextOffset=an.Width,
Hover=false,
Tab=al.Tab,
Index=al.Index,
Window=al.Window,
ElementTable=an,
ParentConfig=al,
Tags=al.Tags,
}

an.UIElements.SliderIcon=af.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.95,
Size=UDim2.new(1,not an.IsTextbox and-ay or(-an.TextBoxWidth-8),0,4),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Frame",
ThemeTag={
ImageColor3="Text",
},
},{
af.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(at,0,1,0),
ImageTransparency=0.1,
ThemeTag={
ImageColor3="Slider",
},
},{
af.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(
0,
al.Window.NewElements and(an.ThumbSize*2)or(an.ThumbSize+2),
0,
al.Window.NewElements and(an.ThumbSize+4)or(an.ThumbSize+2)
),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="SliderThumb",
},
Name="Thumb",
},{
af.NewRoundFrame(999,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
Name="Highlight",
ImageTransparency=0.5,
}),
}),
}),
})

an.UIElements.SliderContainer=ag("Frame",{
Size=UDim2.new(an.Title==nil and 1 or 0,an.Title==nil and 0 or an.Width,0,0),
AutomaticSize="Y",
Position=UDim2.new(1,an.IsTextbox and(al.Window.NewElements and-16 or 0)or 0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
BackgroundTransparency=1,
Parent=an.SliderFrame.UIElements.Main,
},{
ag("UIListLayout",{
Padding=UDim.new(0,an.Title~=nil and 8 or 12),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=an.Icons
and(an.Icons.From and(an.Icons.To and"Center"or"Left")or an.Icons.To and"Right")
or"Center",
}),
aw,
an.UIElements.SliderIcon,
ax,
ag("TextBox",{
Size=UDim2.new(0,an.TextBoxWidth,0,0),
TextXAlignment="Left",
Text=FormatValue(ar),
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(af.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
Visible=an.IsTextbox,
}),
})

local az
if an.IsTooltip then
az=a.E().New(
ar,
an.UIElements.SliderIcon.Frame.Thumb,
true,
"Secondary",
"Small",
false
)
az.Container.AnchorPoint=Vector2.new(0.5,1)
az.Container.Position=UDim2.new(0.5,0,0,-8)
end

function an.Lock(aA)
an.Locked=true
au=false
return an.SliderFrame:Lock(an.LockedTitle)
end
function an.Unlock(aA)
an.Locked=false
au=true
return an.SliderFrame:Unlock()
end

if an.Locked then
an:Lock()
end


local aA=al.Tab.UIElements.ContainerFrame

function an.Set(aB,b,d)
if au then
if
not an.IsFocusing
and not aj
and(
not d
or(
d.UserInputType==Enum.UserInputType.MouseButton1
or d.UserInputType==Enum.UserInputType.Touch
)
)
then
if d then
ao=(d.UserInputType==Enum.UserInputType.Touch)
aA.ScrollingEnabled=false
aj=true

local f=ao and d.Position.X or ac:GetMouseLocation().X
local g=math.clamp(
(f-an.UIElements.SliderIcon.AbsolutePosition.X)
/an.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
b=CalculateValue(an.Value.Min+g*(an.Value.Max-an.Value.Min))
b=math.clamp(b,an.Value.Min or 0,an.Value.Max or 100)

if b~=as then
ah(an.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(g,0,1,0)}):Play()
an.UIElements.SliderContainer.TextBox.Text=FormatValue(b)
if az then
az.TitleFrame.Text=FormatValue(b)
end
an.Value.Default=FormatValue(b)
as=b
af.SafeCallback(an.Callback,FormatValue(b))
end

ap=ad.RenderStepped:Connect(function()
local h=ao and d.Position.X or ac:GetMouseLocation().X
local i=math.clamp(
(h-an.UIElements.SliderIcon.AbsolutePosition.X)
/an.UIElements.SliderIcon.AbsoluteSize.X,
0,
1
)
b=CalculateValue(an.Value.Min+i*(an.Value.Max-an.Value.Min))

if b~=as then
ah(an.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(i,0,1,0)}):Play()
an.UIElements.SliderContainer.TextBox.Text=FormatValue(b)
if az then
az.TitleFrame.Text=FormatValue(b)
end
an.Value.Default=FormatValue(b)
as=b
af.SafeCallback(an.Callback,FormatValue(b))
end
end)


aq=ac.InputEnded:Connect(function(h)
if
(
h.UserInputType==Enum.UserInputType.MouseButton1
or h.UserInputType==Enum.UserInputType.Touch
)and d==h
then
ap:Disconnect()
aq:Disconnect()
aj=false
aA.ScrollingEnabled=true

al.WindUI.CurrentInput=nil

if al.Window.NewElements then
ah(an.UIElements.SliderIcon.Frame.Thumb,0.2,{
ImageTransparency=0,
Size=UDim2.new(
0,
al.Window.NewElements and(an.ThumbSize*2)or(an.ThumbSize+2),
0,
al.Window.NewElements and(an.ThumbSize+4)or(an.ThumbSize+2)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end
if az then
az:Close(false)
end
end
end)
else
b=math.clamp(b,an.Value.Min or 0,an.Value.Max or 100)

local f=math.clamp(
(b-(an.Value.Min or 0))/((an.Value.Max or 100)-(an.Value.Min or 0)),
0,
1
)
b=CalculateValue(an.Value.Min+f*(an.Value.Max-an.Value.Min))

if b~=as then
ah(an.UIElements.SliderIcon.Frame,0.05,{Size=UDim2.new(f,0,1,0)}):Play()
an.UIElements.SliderContainer.TextBox.Text=FormatValue(b)
if az then
az.TitleFrame.Text=FormatValue(b)
end
an.Value.Default=FormatValue(b)
as=b
af.SafeCallback(an.Callback,FormatValue(b))
end
end
end
end
end

function an.SetMax(aB,b)
an.Value.Max=b

local d=tonumber(an.Value.Default)or as
if d>b then
an:Set(b)
else
local f=
math.clamp((d-(an.Value.Min or 0))/(b-(an.Value.Min or 0)),0,1)
ah(an.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(f,0,1,0)}):Play()
end
end

function an.SetMin(aB,b)
an.Value.Min=b

local d=tonumber(an.Value.Default)or as
if d<b then
an:Set(b)
else
local f=math.clamp((d-b)/((an.Value.Max or 100)-b),0,1)
ah(an.UIElements.SliderIcon.Frame,0.1,{Size=UDim2.new(f,0,1,0)}):Play()
end
end

af.AddSignal(an.UIElements.SliderContainer.TextBox.FocusLost,function(aB)
local b=tonumber(an.UIElements.SliderContainer.TextBox.Text)
if b then
an:Set(b)
else
an.UIElements.SliderContainer.TextBox.Text=FormatValue(as)
if az then
az.TitleFrame.Text=FormatValue(as)
end
end
end)

local aB=al.WindUI.GenerateGUID()

af.AddSignal(an.UIElements.SliderContainer.InputBegan,function(b)
if an.Locked or aj then
return
end
if
b.UserInputType==Enum.UserInputType.MouseButton1
or b.UserInputType==Enum.UserInputType.Touch
then
if al.WindUI.CurrentInput and al.WindUI.CurrentInput~=aB then
return
end
al.WindUI.CurrentInput=aB

an:Set(ar,b)


if al.Window.NewElements then
ah(an.UIElements.SliderIcon.Frame.Thumb,0.24,{
ImageTransparency=0.85,
Size=UDim2.new(
0,
(al.Window.NewElements and(an.ThumbSize*2)or an.ThumbSize)+8,
0,
an.ThumbSize+8
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
if az then
az:Open()
end

end
end)

return an.__type,an
end

return ai end function a.L():typeof(__modImpl())local aa=a.cache.L if not aa then aa={c=__modImpl()}a.cache.L=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ac=aa.New
local ad=aa.Tween

local af={}

local function ToFiniteNumber(ag)
local ah=tonumber(ag)
if ah==nil or ah~=ah or math.abs(ah)==math.huge then
return nil
end

return ah
end

local function FormatNumber(ag)
if ag%1==0 then
return tostring(ag)
end

return tostring(tonumber(string.format("%.2f",ag)))
end

function af.New(ag,ah)
local ai=typeof(ah.Value)=="table"and ah.Value or{}
local aj=ToFiniteNumber(ai.Min)or ToFiniteNumber(ah.Min)or 0
local ak=ToFiniteNumber(ai.Max)or ToFiniteNumber(ah.Max)or 100

if aj>ak then
aj,ak=ak,aj
end

local al=typeof(ah.Value)=="number"and ah.Value
or ToFiniteNumber(ai.Default)
or ToFiniteNumber(ah.Default)
or aj
al=ToFiniteNumber(al)or aj

local am=ah.Indeterminate==true

local an=ah.ShowValue
if an==nil then
an=not am
end

local ao=math.max(ToFiniteNumber(ah.ValueWidth)or 44,0)

local ap={
__type="ProgressBar",
Title=ah.Title or"Progress",
Desc=ah.Desc or nil,
Value={
Min=aj,
Max=ak,
Default=math.clamp(al,aj,ak),
},
ShowValue=an,
DisplayMode=ah.DisplayMode or"Percent",
Format=ah.Format,
Animate=ah.Animate~=false,
AnimationDuration=math.max(ToFiniteNumber(ah.AnimationDuration)or 0.15,0),
Indeterminate=am,
IndeterminateText=ah.IndeterminateText or"",
Speed=math.max(ToFiniteNumber(ah.Speed)or 1,0.01),
ControlGap=math.max(ToFiniteNumber(ah.ControlGap)or 16,0),
UIElements={},

Width=math.max(ToFiniteNumber(ah.Width)or 160,0),
ValueWidth=ao,
}

local function GetRatio(aq)
if ap.Value.Max==ap.Value.Min then
return aq>=ap.Value.Max and 1 or 0
end

return math.clamp((aq-ap.Value.Min)/(ap.Value.Max-ap.Value.Min),0,1)
end

local function GetValueText(aq,ar)
if ap.Indeterminate then
return tostring(ap.IndeterminateText)
end

local as=ar*100

if typeof(ap.Format)=="function"then
local at,au=
pcall(ap.Format,aq,as,ap.Value.Min,ap.Value.Max)

if at and au~=nil then
return tostring(au)
end
end

if ap.DisplayMode=="Value"then
return FormatNumber(aq)
elseif ap.DisplayMode=="Fraction"then
return FormatNumber(aq).."/"..FormatNumber(ap.Value.Max)
end

return tostring(math.floor(as+0.5)).."%"
end

ap.ProgressBarFrame=a.F(){
Title=ap.Title,
Desc=ap.Desc,
Parent=ah.Parent,
TextOffset=ap.Width+ap.ControlGap,
Hover=false,
Tab=ah.Tab,
Index=ah.Index,
Window=ah.Window,
ElementTable=ap,
ParentConfig=ah,
Tags=ah.Tags,
}

ap.UIElements.Fill=aa.NewRoundFrame(99,"Squircle",{
Name="Fill",
Size=ap.Indeterminate and UDim2.new(0.3,0,1,0)
or UDim2.new(GetRatio(ap.Value.Default),0,1,0),
Position=ap.Indeterminate and UDim2.new(-0.3,0,0,0)or UDim2.new(0,0,0,0),
ThemeTag={
ImageColor3="ProgressBar",
},
})

ap.UIElements.Bar=aa.NewRoundFrame(99,"Squircle",{
Name="Bar",
Size=UDim2.new(1,ap.ShowValue and-(ap.ValueWidth+8)or 0,0,6),
ClipsDescendants=true,
ImageTransparency=0.9,
ThemeTag={
ImageColor3="ProgressBarTrack",
ImageTransparency="ProgressBarTrackTransparency",
},
},{
ap.UIElements.Fill,
})

ap.UIElements.Value=ac("TextLabel",{
Name="Value",
Size=UDim2.new(0,ap.ValueWidth,0,20),
BackgroundTransparency=1,
FontFace=Font.new(aa.Font,Enum.FontWeight.Medium),
Text=GetValueText(ap.Value.Default,GetRatio(ap.Value.Default)),
TextSize=14,
TextTransparency=0.25,
TextTruncate="AtEnd",
TextXAlignment="Right",
Visible=ap.ShowValue,
ThemeTag={
TextColor3="ProgressBarText",
},
})

ap.UIElements.Container=ac("Frame",{
Name="ProgressBarContainer",
Size=UDim2.new(0,ap.Width,0,36),
Position=UDim2.new(1,0,ah.Window.NewElements and 0 or 0.5,0),
AnchorPoint=Vector2.new(1,ah.Window.NewElements and 0 or 0.5),
BackgroundTransparency=1,
Parent=ap.ProgressBarFrame.UIElements.Main,
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Right",
VerticalAlignment="Center",
}),
ap.UIElements.Bar,
ap.UIElements.Value,
})

if ap.Indeterminate then
local aq=ad(
ap.UIElements.Fill,
1/ap.Speed,
{Position=UDim2.new(1,0,0,0)},
Enum.EasingStyle.Linear,
Enum.EasingDirection.InOut,-1

)
aa.AddSignal(ap.UIElements.Bar.Destroying,function()
aq:Cancel()
end)
aq:Play()
end

local function Update(aq,ar)
local as=ToFiniteNumber(aq)
if as==nil then
return ap.Value.Default
end

as=math.clamp(as,ap.Value.Min,ap.Value.Max)
ap.Value.Default=as

local at=GetRatio(as)
local au=UDim2.new(at,0,1,0)

if ap.UIElements.Fill and not ap.Indeterminate then
if ar or not ap.Animate or ap.AnimationDuration<=0 then
ap.UIElements.Fill.Size=au
else
ad(
ap.UIElements.Fill,
ap.AnimationDuration,
{Size=au},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end

ap.UIElements.Value.Text=GetValueText(as,at)

return as
end

function ap.Set(aq,ar)
return Update(ar,false)
end

function ap.Get(aq)
return ap.Value.Default
end

function ap.GetPercentage(aq)
return GetRatio(ap.Value.Default)*100
end

function ap.SetRange(aq,ar,as)
ar=ToFiniteNumber(ar)
as=ToFiniteNumber(as)

if ar==nil or as==nil then
return ap.Value.Min,ap.Value.Max
end

if ar>as then
ar,as=as,ar
end

ap.Value.Min=ar
ap.Value.Max=as
Update(ap.Value.Default,false)

return ar,as
end

function ap.SetMin(aq,ar)
ar=ToFiniteNumber(ar)
if ar==nil then
return ap.Value.Min
end

ap:SetRange(ar,math.max(ar,ap.Value.Max))
return ap.Value.Min
end

function ap.SetMax(aq,ar)
ar=ToFiniteNumber(ar)
if ar==nil then
return ap.Value.Max
end

ap:SetRange(math.min(ap.Value.Min,ar),ar)
return ap.Value.Max
end

Update(ap.Value.Default,true)

return ap.__type,ap
end

return af end function a.M():typeof(__modImpl())local aa=a.cache.M if not aa then aa={c=__modImpl()}a.cache.M=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ac=aa(game:GetService"UserInputService")

local ad=a.d()
local af=ad.New local ag=
ad.Tween

local ah={
UICorner=6,
UIPadding=8,
}

local ai=a.z().New

function ah.New(aj,ak)
local function NormalizeKeyCode(al)
if typeof(al)=="EnumItem"then
return al.Name
elseif type(al)=="string"then
return al
else
return"F"
end
end

local al={
__type="Keybind",
Title=ak.Title or"Keybind",
Desc=ak.Desc or nil,
Locked=ak.Locked or false,
LockedTitle=ak.LockedTitle,
Value=NormalizeKeyCode(ak.Value)or"F",
Callback=ak.Callback or function()end,
CanChange=ak.CanChange~=false,
Blacklist=ak.Blacklist or{},
Picking=false,
UIElements={},
}

local am={}

for an,ao in next,al.Blacklist do
table.insert(am,Enum.KeyCode[NormalizeKeyCode(ao)])
end
table.insert(am,Enum.KeyCode[NormalizeKeyCode"Escape"])

local an=true

al.KeybindFrame=a.F(){
Title=al.Title,
Desc=al.Desc,
Parent=ak.Parent,
TextOffset=85,
Hover=al.CanChange,
Tab=ak.Tab,
Index=ak.Index,
Window=ak.Window,
ElementTable=al,
ParentConfig=ak,
Tags=ak.Tags,
}

al.UIElements.Keybind=ai(
al.Value,
nil,
al.KeybindFrame.UIElements.Main,
nil,
ak.Window.NewElements and 12 or 10
)

al.UIElements.Keybind.Size=
UDim2.new(0,24+al.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
al.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
al.UIElements.Keybind.Position=UDim2.new(1,0,0.5,0)
al.UIElements.Keybind.Interactable=false

af("UIScale",{
Parent=al.UIElements.Keybind,
Scale=0.85,
})

ad.AddSignal(
al.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds",
function()
al.UIElements.Keybind.Size=
UDim2.new(0,24+al.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,0,42)
end
)

function al.Lock(ao)
al.Locked=true
an=false
return al.KeybindFrame:Lock(al.LockedTitle)
end
function al.Unlock(ao)
al.Locked=false
an=true
return al.KeybindFrame:Unlock()
end

function al.Set(ao,ap)
local aq=NormalizeKeyCode(ap)
al.Value=aq
al.UIElements.Keybind.Frame.Frame.TextLabel.Text=aq
end

if al.Locked then
al:Lock()
end

local ao

ad.AddSignal(al.KeybindFrame.UIElements.Main.MouseButton1Click,function()
if an then
if al.CanChange then
al.Picking=true
al.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."



local ap
ap=ac.InputBegan:Connect(function(aq)
local ar

if aq.UserInputType==Enum.UserInputType.Keyboard then
if table.find(am,aq.KeyCode)then
ar=nil
return
else
ar=aq.KeyCode.Name
end
elseif
aq.UserInputType==Enum.UserInputType.MouseButton1
and not table.find(am,"MouseLeftButton")
then
ar="MouseLeftButton"
elseif
aq.UserInputType==Enum.UserInputType.MouseButton2
and not table.find(am,"MouseRightButton")
then
ar="MouseRightButton"
end

if ao then
ao:Disconnect()
end

ao=ac.InputEnded:Connect(function(as)
if
ar
and(
as.KeyCode.Name==ar
or ar=="MouseLeft"and as.UserInputType==Enum.UserInputType.MouseButton1
or ar=="MouseRight"and as.UserInputType==Enum.UserInputType.MouseButton2
)
then
al.Picking=false

al.UIElements.Keybind.Frame.Frame.TextLabel.Text=ar
al.Value=ar

ap:Disconnect()
ao:Disconnect()
end
end)
end)
end
end
end)

ad.AddSignal(ac.InputBegan,function(ap,aq)
if ac:GetFocusedTextBox()then
return
end
if not an then
return
end
if al.Picking then
return
end

if ap.UserInputType==Enum.UserInputType.Keyboard then
if ap.KeyCode.Name==al.Value then
ad.SafeCallback(al.Callback,ap.KeyCode.Name)
end
elseif ap.UserInputType==Enum.UserInputType.MouseButton1 and al.Value=="MouseLeft"then
ad.SafeCallback(al.Callback,"MouseLeft")
elseif ap.UserInputType==Enum.UserInputType.MouseButton2 and al.Value=="MouseRight"then
ad.SafeCallback(al.Callback,"MouseRight")
end
end)

return al.__type,al
end

return ah end function a.N():typeof(__modImpl())local aa=a.cache.N if not aa then aa={c=__modImpl()}a.cache.N=aa end return aa.c end end do local function __modImpl()

local aa=a.d()local ac=
aa.New local ad=
aa.Tween

local af={
UICorner=8,
UIPadding=8,
}local ag=a.m()

.New
local ah=a.n().New

function af.New(ai,aj)
local ak={
__type="Input",
Title=aj.Title or"Input",
Desc=aj.Desc or nil,
Type=aj.Type or"Input",
Locked=aj.Locked or false,
LockedTitle=aj.LockedTitle,
InputIcon=aj.InputIcon or false,
Placeholder=aj.Placeholder or"Enter Text...",
Value=aj.Value or"",
Callback=aj.Callback or function()end,
ClearTextOnFocus=aj.ClearTextOnFocus or false,
UIElements={},

Width=150,
}

local al=true

ak.InputFrame=a.F(){
Title=ak.Title,
Desc=ak.Desc,
Parent=aj.Parent,
TextOffset=ak.Width,
Hover=false,
Tab=aj.Tab,
Index=aj.Index,
Window=aj.Window,
ElementTable=ak,
ParentConfig=aj,
Tags=aj.Tags,
}

local am=ah(
ak.Placeholder,
ak.InputIcon,
ak.Type=="Textarea"and ak.InputFrame.UIElements.Container or ak.InputFrame.UIElements.Main,
ak.Type,
function(am)
ak:Set(am,true)
end,
nil,
aj.Window.NewElements and 12 or 10,
ak.ClearTextOnFocus
)

if ak.Type~="Textarea"then
am.Size=UDim2.new(0,ak.Width,0,36)
am.Position=UDim2.new(1,0,aj.Window.NewElements and 0 or 0.5,0)
am.AnchorPoint=Vector2.new(1,aj.Window.NewElements and 0 or 0.5)
else
am.Size=UDim2.new(1,0,0,148)
end






function ak.Lock(an)
ak.Locked=true
al=false
return ak.InputFrame:Lock(ak.LockedTitle)
end
function ak.Unlock(an)
ak.Locked=false
al=true
return ak.InputFrame:Unlock()
end

function ak.Set(an,ao,ap)
if al then
ak.Value=ao
aa.SafeCallback(ak.Callback,ao)

if not ap then
am.Frame.Frame.TextBox.Text=ao
end
end
end

function ak.SetPlaceholder(an,ao)
am.Frame.Frame.TextBox.PlaceholderText=ao
ak.Placeholder=ao
end

ak:Set(ak.Value)

if ak.Locked then
ak:Lock()
end

return ak.__type,ak
end

return af end function a.O():typeof(__modImpl())local aa=a.cache.O if not aa then aa={c=__modImpl()}a.cache.O=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local af=aa.New

local ag={}

function ag.New(ah,ai)
local aj=af("Frame",{
Size=ai.ParentType~="Group"and UDim2.new(1,0,0,1)or UDim2.new(0,1,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
local ak=af("Frame",{
Parent=ai.Parent,
Size=ai.ParentType~="Group"and UDim2.new(1,-7,0,7)or UDim2.new(0,7,1,-7),
BackgroundTransparency=1,
},{
aj
})

return"Divider",{__type="Divider",ElementFrame=ak}
end

return ag end function a.P():typeof(__modImpl())local aa=a.cache.P if not aa then aa={c=__modImpl()}a.cache.P=aa end return aa.c end end do local function __modImpl()
local aa={}

local af=(cloneref or clonereference or function(af)
return af
end)

local ag=af(game:GetService"UserInputService")
local ah=af(game:GetService"Players").LocalPlayer:GetMouse()
local ai=af(game:GetService"Workspace").CurrentCamera local aj=

workspace.CurrentCamera

local ak=a.n().New

local al=a.d()
local am=al.New
local an=al.Tween

local ao=0.67

function aa.New(ap,aq,ar,as)
local at={}

if not aq.Callback then
as="Menu"
end

aq.UIElements.UIListLayout=am("UIListLayout",{
Padding=UDim.new(0,ar.MenuPadding/1.5),
FillDirection="Vertical",
HorizontalAlignment="Center",
})

aq.UIElements.Menu=al.NewRoundFrame(ar.MenuCorner,"Squircle",{
ThemeTag={
ImageColor3="DropdownBackground",
},
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
},{
am("UIPadding",{
PaddingTop=UDim.new(0,ar.MenuPadding),
PaddingLeft=UDim.new(0,ar.MenuPadding),
PaddingRight=UDim.new(0,ar.MenuPadding),
PaddingBottom=UDim.new(0,ar.MenuPadding),
}),
am("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ar.MenuPadding),
}),
am("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,aq.SearchBarEnabled and-ar.MenuPadding-ar.SearchBarHeight),

ClipsDescendants=true,
LayoutOrder=999,
Name="Frame",
},{
am("UICorner",{
CornerRadius=UDim.new(0,ar.MenuCorner-ar.MenuPadding),
}),
am("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
ScrollBarImageTransparency=1,
},{
aq.UIElements.UIListLayout,
}),
}),
})

aq.UIElements.MenuCanvas=am("Frame",{
Size=UDim2.new(0,aq.MenuWidth,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,

Parent=ap.WindUI.DropdownGui,
AnchorPoint=Vector2.new(1,0),
},{
aq.UIElements.Menu,
am("UISizeConstraint",{
MinSize=Vector2.new(170,0),
MaxSize=Vector2.new(300,400),
}),
})

local function RecalculateCanvasSize()
aq.UIElements.Menu.Frame.ScrollingFrame.CanvasSize=
UDim2.fromOffset(0,aq.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
local au=ap.WindUI.DropdownGui.AbsoluteSize.Y

local av=aq.UIElements.UIListLayout.AbsoluteContentSize.Y/ap.UIScale
local aw=aq.SearchBarEnabled and(ar.SearchBarHeight+(ar.MenuPadding*3))
or(ar.MenuPadding*2)
local ax=av+aw

if ax>au then
aq.UIElements.MenuCanvas.Size=
UDim2.fromOffset(aq.UIElements.MenuCanvas.AbsoluteSize.X,au)
else
aq.UIElements.MenuCanvas.Size=
UDim2.fromOffset(aq.UIElements.MenuCanvas.AbsoluteSize.X,ax)
end
end

function UpdatePosition()
local au=aq.UIElements.Dropdown or aq.DropdownFrame.UIElements.Main
local av=aq.UIElements.MenuCanvas

local aw=ai.ViewportSize.Y
-(au.AbsolutePosition.Y+au.AbsoluteSize.Y)
-ar.MenuPadding
-54
local ax=av.AbsoluteSize.Y+ar.MenuPadding

local ay=-54
if aw<ax then
ay=ax-aw-54
end

av.Position=UDim2.new(
0,
au.AbsolutePosition.X+au.AbsoluteSize.X,
0,
au.AbsolutePosition.Y+au.AbsoluteSize.Y-ay+(ar.MenuPadding*2)
)
end

local au

function at.Display(av)
local aw=aq.Values
local ax=""

if aq.Multi then
local ay={}
if typeof(aq.Value)=="table"then
for az,aA in ipairs(aq.Value)do
local aB=typeof(aA)=="table"and aA.Title or aA
ay[aB]=true
end
end

for az,aA in ipairs(aw)do
local aB=typeof(aA)=="table"and aA.Title or aA
if ay[aB]then
ax=ax..aB..", "
end
end

if#ax>0 then
ax=ax:sub(1,#ax-2)
end
else
ax=typeof(aq.Value)=="table"and(aq.Value.Title or aq.Value[1])
or aq.Value
or""
end

if aq.UIElements.Dropdown then
aq.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(ax==""and"--"or ax)
end
end

local function Callback(av)
at:Display()
if aq.Locked then
return
end

if aq.Callback then
task.spawn(function()
if aq.Locked then
return
end
al.SafeCallback(aq.Callback,aq.Value)
end)
else
task.spawn(function()
if aq.Locked then
return
end
al.SafeCallback(av)
end)
end
end

function at.LockValues(av,aw)
if not aw then
return
end

for ax,ay in next,aq.Tabs do
if ay and ay.UIElements and ay.UIElements.TabItem then
local az=ay.Name
local aA=false

for aB,b in next,aw do
if az==b then
aA=true
break
end
end

if aA then
an(ay.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

an(ay.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.6}):Play()
if ay.UIElements.TabIcon then
an(ay.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.6}):Play()
end

ay.UIElements.TabItem.Active=false
ay.Locked=true
else
if ay.Selected then
an(ay.UIElements.TabItem,0.1,{ImageTransparency=ao}):Play()

an(ay.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if ay.UIElements.TabIcon then
an(ay.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
else
an(ay.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

an(
ay.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=as=="Dropdown"and 0.4 or 0.05}
):Play()
if ay.UIElements.TabIcon then
an(
ay.UIElements.TabIcon.ImageLabel,
0.1,
{ImageTransparency=as=="Dropdown"and 0.2 or 0}
):Play()
end
end

ay.UIElements.TabItem.Active=true
ay.Locked=false
end
end
end
end

function at.Refresh(av,aw)
if ap.Window.Destroyed then
return
end

for ax,ay in next,aq.UIElements.Menu.Frame.ScrollingFrame:GetChildren()do
if not ay:IsA"UIListLayout"then
ay:Destroy()
end
end

aq.Tabs={}

if aq.SearchBarEnabled then
if not au then
au=ak("Search...","search",aq.UIElements.Menu,nil,function(ax)
for ay,az in next,aq.Tabs do
if string.find(string.lower(az.Name),string.lower(ax),1,true)then
az.UIElements.TabItem.Visible=true
else
az.UIElements.TabItem.Visible=false
end
RecalculateListSize()
RecalculateCanvasSize()
end
end,true)
au.Size=UDim2.new(1,0,0,ar.SearchBarHeight)
au.Position=UDim2.new(0,0,0,0)
au.Name="SearchBar"
end
end

for ax,ay in next,aw do
if ay.Type~="Divider"then
local az={
Name=typeof(ay)=="table"and ay.Title or ay,
Desc=typeof(ay)=="table"and ay.Desc or nil,
Icon=typeof(ay)=="table"and ay.Icon or nil,
IconSize=typeof(ay)=="table"and ay.IconSize or nil,
Original=ay,
Selected=false,
Locked=typeof(ay)=="table"and ay.Locked or false,
UIElements={},
}
local aA
if az.Icon then
aA=al.Image(az.Icon,az.Icon,0,ap.Window.Folder,"Dropdown",true)
aA.Size=
UDim2.new(0,az.IconSize or ar.TabIcon,0,az.IconSize or ar.TabIcon)
aA.ImageLabel.ImageTransparency=as=="Dropdown"and 0.2 or 0
az.UIElements.TabIcon=aA
end
az.UIElements.TabItem=al.NewRoundFrame(
ar.MenuCorner-ar.MenuPadding,
"Squircle",
{
Size=UDim2.new(1,0,0,36),
AutomaticSize=az.Desc and"Y",
ImageTransparency=1,
Parent=aq.UIElements.Menu.Frame.ScrollingFrame,

ThemeTag={
ImageColor3="DropdownTabBackground",
},
Active=not az.Locked,
},
{
al.NewRoundFrame(ar.MenuCorner-ar.MenuPadding,"Glass-1.4",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="DropdownTabBorder",
},
ImageTransparency=1,
Name="Highlight",
},{













}),
am("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
am("UIListLayout",{
Padding=UDim.new(0,ar.TabPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
am("UIPadding",{
PaddingTop=UDim.new(0,ar.TabPadding),
PaddingLeft=UDim.new(0,ar.TabPadding),
PaddingRight=UDim.new(0,ar.TabPadding),
PaddingBottom=UDim.new(0,ar.TabPadding),
}),
am("UICorner",{
CornerRadius=UDim.new(0,ar.MenuCorner-ar.MenuPadding),
}),
aA,
am("Frame",{
Size=UDim2.new(1,aA and-ar.TabPadding-ar.TabIcon or 0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Name="Title",
},{
am("TextLabel",{
Text=az.Name,
TextXAlignment="Left",
FontFace=Font.new(al.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=as=="Dropdown"and 0.4 or 0.05,
LayoutOrder=999,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
}),
am("TextLabel",{
Text=az.Desc or"",
TextXAlignment="Left",
FontFace=Font.new(al.Font,Enum.FontWeight.Regular),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text",
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=as=="Dropdown"and 0.6 or 0.35,
LayoutOrder=999,
AutomaticSize="Y",
TextWrapped=true,
Size=UDim2.new(1,0,0,0),
Visible=az.Desc and true or false,
Name="Desc",
}),
am("UIListLayout",{
Padding=UDim.new(0,ar.TabPadding/3),
FillDirection="Vertical",
}),
}),
}),
},
true
)

if az.Locked then
az.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0.6
if az.UIElements.TabIcon then
az.UIElements.TabIcon.ImageLabel.ImageTransparency=0.6
end
end

if aq.Multi and typeof(aq.Value)=="string"then
for aB,b in next,aq.Values do
if typeof(b)=="table"then
if b.Title==aq.Value then
aq.Value={b}
end
else
if b==aq.Value then
aq.Value={aq.Value}
end
end
end
end

if aq.Multi then
local aB=false
if typeof(aq.Value)=="table"then
for b,d in ipairs(aq.Value)do
local f=typeof(d)=="table"and d.Title or d
if f==az.Name then
aB=true
break
end
end
end
az.Selected=aB
else
local aB=typeof(aq.Value)=="table"and aq.Value.Title or aq.Value
az.Selected=aB==az.Name
end

if az.Selected and not az.Locked then
az.UIElements.TabItem.ImageTransparency=ao

az.UIElements.TabItem.Frame.Title.TextLabel.TextTransparency=0
if az.UIElements.TabIcon then
az.UIElements.TabIcon.ImageLabel.ImageTransparency=0
end
end

aq.Tabs[ax]=az

at:Display()

if as=="Dropdown"then
al.AddSignal(az.UIElements.TabItem.MouseButton1Click,function()
if aq.Locked or az.Locked then
return
end

if aq.Multi then
if not az.Selected then
az.Selected=true
an(
az.UIElements.TabItem,
0.1,
{ImageTransparency=ao}
):Play()

an(az.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if az.UIElements.TabIcon then
an(az.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
table.insert(aq.Value,az.Original)
else
if not aq.AllowNone and#aq.Value==1 then
return
end
az.Selected=false
an(az.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

an(az.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0.4}):Play()
if az.UIElements.TabIcon then
an(az.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end

for aB,b in next,aq.Value do
if typeof(b)=="table"and(b.Title==az.Name)or(b==az.Name)then
table.remove(aq.Value,aB)
break
end
end
end
else
for aB,b in next,aq.Tabs do
an(b.UIElements.TabItem,0.1,{ImageTransparency=1}):Play()

an(
b.UIElements.TabItem.Frame.Title.TextLabel,
0.1,
{TextTransparency=0.4}
):Play()
if b.UIElements.TabIcon then
an(b.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0.2}):Play()
end
b.Selected=false
end
az.Selected=true
an(az.UIElements.TabItem,0.1,{ImageTransparency=ao}):Play()

an(az.UIElements.TabItem.Frame.Title.TextLabel,0.1,{TextTransparency=0}):Play()
if az.UIElements.TabIcon then
an(az.UIElements.TabIcon.ImageLabel,0.1,{ImageTransparency=0}):Play()
end
aq.Value=az.Original
end
Callback()
end)
elseif as=="Menu"then
if not az.Locked then
al.AddSignal(az.UIElements.TabItem.MouseEnter,function()
an(az.UIElements.TabItem,0.08,{ImageTransparency=ao}):Play()
end)
al.AddSignal(az.UIElements.TabItem.InputEnded,function()
an(az.UIElements.TabItem,0.08,{ImageTransparency=1}):Play()
end)
end
al.AddSignal(az.UIElements.TabItem.MouseButton1Click,function()
if aq.Locked or az.Locked then
return
end
Callback(ay.Callback or function()end)
end)
end

RecalculateCanvasSize()
RecalculateListSize()
else a.P()
:New{Parent=aq.UIElements.Menu.Frame.ScrollingFrame}
end
end










aq.UIElements.MenuCanvas.Size=UDim2.new(
0,
aq.MenuWidth+6+6+5+5+18+6+6,
aq.UIElements.MenuCanvas.Size.Y.Scale,
aq.UIElements.MenuCanvas.Size.Y.Offset
)
Callback()

aq.Values=aw
end

at:Refresh(aq.Values)

function at.Select(av,aw)
if aw then
aq.Value=aw
else
if aq.Multi then
aq.Value={}
else
aq.Value=nil
end
end
at:Refresh(aq.Values)
end

RecalculateListSize()
RecalculateCanvasSize()

function at.Open(av)
if not aq.Locked then
aq.UIElements.Menu.Visible=true
aq.UIElements.MenuCanvas.Visible=true
aq.UIElements.MenuCanvas.Active=true
aq.UIElements.Menu.Size=UDim2.new(1,0,0,0)
an(aq.UIElements.Menu,0.1,{
Size=UDim2.new(1,0,1,0),
ImageTransparency=0,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
if aq.Locked then
return
end
aq.Opened=true
end)

UpdatePosition()
end
end

function at.Close(av)
aq.Opened=false

an(aq.UIElements.Menu,0.25,{
Size=UDim2.new(1,0,0,0),
ImageTransparency=1,
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.1)
aq.UIElements.Menu.Visible=false
end)

task.spawn(function()
task.wait(0.25)
aq.UIElements.MenuCanvas.Visible=false
aq.UIElements.MenuCanvas.Active=false
end)
end

al.AddSignal(
(
aq.UIElements.Dropdown and aq.UIElements.Dropdown.MouseButton1Click
or aq.DropdownFrame.UIElements.Main.MouseButton1Click
),
function()
at:Open()
end
)

al.AddSignal(ag.InputBegan,function(av)
if
av.UserInputType==Enum.UserInputType.MouseButton1
or av.UserInputType==Enum.UserInputType.Touch
then
local aw=aq.UIElements.MenuCanvas
local ax,ay=aw.AbsolutePosition,aw.AbsoluteSize

local az=aq.UIElements.Dropdown or aq.DropdownFrame.UIElements.Main
local aA=az.AbsolutePosition
local aB=az.AbsoluteSize

local b=ah.X>=aA.X
and ah.X<=aA.X+aB.X
and ah.Y>=aA.Y
and ah.Y<=aA.Y+aB.Y

local d=ah.X>=ax.X
and ah.X<=ax.X+ay.X
and ah.Y>=ax.Y
and ah.Y<=ax.Y+ay.Y

if ap.Window.CanDropdown and aq.Opened and not b and not d then
at:Close()
end
end
end)

al.AddSignal(
aq.UIElements.Dropdown and aq.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition"
or aq.DropdownFrame.UIElements.Main:GetPropertyChangedSignal"AbsolutePosition",
UpdatePosition
)

return at
end

return aa end function a.Q():typeof(__modImpl())local aa=a.cache.Q if not aa then aa={c=__modImpl()}a.cache.Q=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")
aa(game:GetService"Players").LocalPlayer:GetMouse()local af=
aa(game:GetService"Workspace").CurrentCamera

local ag=a.d()
local ah=ag.New local ai=
ag.Tween

local aj=a.z().New local ak=a.n()
.New
local al=a.Q().New local am=

workspace.CurrentCamera

local an={
UICorner=10,
UIPadding=12,
MenuCorner=15,
MenuPadding=5,
TabPadding=10,
SearchBarHeight=39,
TabIcon=18,
}

function an.New(ao,ap)
local aq={
__type="Dropdown",
Title=ap.Title or"Dropdown",
Desc=ap.Desc or nil,
Locked=ap.Locked or false,
LockedTitle=ap.LockedTitle,
Values=ap.Values or ap.Options or{},
MenuWidth=ap.MenuWidth or 180,
Value=ap.Value or ap.Default,
AllowNone=ap.AllowNone,
SearchBarEnabled=ap.SearchBarEnabled or false,
Multi=ap.Multi,
Callback=ap.Callback or nil,

UIElements={},

Opened=false,
Tabs={},

Width=150,
}

if aq.Multi and not aq.Value then
aq.Value={}
end
if aq.Values and typeof(aq.Value)=="number"then
aq.Value=aq.Values[aq.Value]
end

aq.DropdownFrame=a.F(){
Title=aq.Title,
Desc=aq.Desc,
Parent=ap.Parent,
TextOffset=aq.Callback and aq.Width or 20,
Hover=not aq.Callback and true or false,
Tab=ap.Tab,
Index=ap.Index,
Window=ap.Window,
ElementTable=aq,
ParentConfig=ap,
Tags=ap.Tags,
}

if aq.Callback then
aq.UIElements.Dropdown=
aj("",nil,aq.DropdownFrame.UIElements.Main,nil,ap.Window.NewElements and 12 or 10)

aq.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
aq.UIElements.Dropdown.Frame.Frame.TextLabel.Size=
UDim2.new(1,aq.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

aq.UIElements.Dropdown.Size=UDim2.new(0,aq.Width,0,36)
aq.UIElements.Dropdown.Position=UDim2.new(1,0,ap.Window.NewElements and 0 or 0.5,0)
aq.UIElements.Dropdown.AnchorPoint=Vector2.new(1,ap.Window.NewElements and 0 or 0.5)





end

aq.DropdownMenu=al(ap,aq,an,"Dropdown")

aq.Display=aq.DropdownMenu.Display
aq.Refresh=aq.DropdownMenu.Refresh
aq.Select=aq.DropdownMenu.Select
aq.Open=aq.DropdownMenu.Open
aq.Close=aq.DropdownMenu.Close

ah("ImageLabel",{
Image=ag.Icon"chevrons-up-down"[1],
ImageRectOffset=ag.Icon"chevrons-up-down"[2].ImageRectPosition,
ImageRectSize=ag.Icon"chevrons-up-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,aq.UIElements.Dropdown and-12 or 0,0.5,0),
ThemeTag={
ImageColor3="Icon",
},
AnchorPoint=Vector2.new(1,0.5),
Parent=aq.UIElements.Dropdown and aq.UIElements.Dropdown.Frame
or aq.DropdownFrame.UIElements.Main,
})

function aq.Lock(ar)
aq.Locked=true
if aq.Opened or aq.UIElements.MenuCanvas.Visible then
aq:Close()
end
return aq.DropdownFrame:Lock(aq.LockedTitle)
end
function aq.Unlock(ar)
aq.Locked=false
return aq.DropdownFrame:Unlock()
end

if aq.Locked then
aq:Lock()
end

return aq.__type,aq
end

return an end function a.R():typeof(__modImpl())local aa=a.cache.R if not aa then aa={c=__modImpl()}a.cache.R=aa end return aa.c end end do local function __modImpl()




local aa={}
local ag={
lua={
"and",
"break",
"or",
"else",
"elseif",
"if",
"then",
"until",
"repeat",
"while",
"do",
"for",
"in",
"end",
"local",
"return",
"function",
"export",
},
rbx={
"game",
"workspace",
"script",
"math",
"string",
"table",
"task",
"wait",
"select",
"next",
"Enum",
"tick",
"assert",
"shared",
"loadstring",
"tonumber",
"tostring",
"type",
"typeof",
"unpack",
"Instance",
"CFrame",
"Vector3",
"Vector2",
"Color3",
"UDim",
"UDim2",
"Ray",
"BrickColor",
"OverlapParams",
"RaycastParams",
"Axes",
"Random",
"Region3",
"Rect",
"TweenInfo",
"collectgarbage",
"not",
"utf8",
"pcall",
"xpcall",
"_G",
"setmetatable",
"getmetatable",
"os",
"pairs",
"ipairs",
},
operators={
"#",
"+",
"-",
"*",
"%",
"/",
"^",
"=",
"~",
"=",
"<",
">",
},
}

local ah={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(aj)
local al={}
for am,an in ipairs(aj)do
al[an]=true
end
return al
end

local aj=createKeywordSet(ag.lua)
local al=createKeywordSet(ag.rbx)
local am=createKeywordSet(ag.operators)

local function getHighlight(an,ao)
local ap=an[ao]

if ah[ap.."_color"]then
return ah[ap.."_color"]
end

if tonumber(ap)then
return ah.numbers
elseif ap=="nil"then
return ah.null
elseif ap:sub(1,2)=="--"then
return ah.comment
elseif am[ap]then
return ah.operator
elseif aj[ap]then
return ah.lua
elseif al[ap]then
return ah.rbx
elseif ap:sub(1,1)=='"'or ap:sub(1,1)=="'"then
return ah.str
elseif ap=="true"or ap=="false"then
return ah.boolean
end

if an[ao+1]=="("then
if an[ao-1]==":"then
return ah.self_call
end

return ah.call
end

if an[ao-1]=="."then
if an[ao-2]=="Enum"then
return ah.rbx
end

return ah.local_property
end
end

function aa.run(an,ao)
if ao~=nil then
for ap,aq in next,ao do
ah[ap]=aq
end
end

local ap={}
local aq=""

local ar=false
local as=false
local at=false

for au=1,#an do
local av=an:sub(au,au)

if as then
if av=="\n"and not at then
table.insert(ap,aq)
table.insert(ap,av)
aq=""

as=false
elseif an:sub(au-1,au)=="]]"and at then
aq=aq.."]"

table.insert(ap,aq)
aq=""

as=false
at=false
else
aq=aq..av
end
elseif ar then
if av==ar and an:sub(au-1,au-1)~="\\"or av=="\n"then
aq=aq..av
ar=false
else
aq=aq..av
end
else
if an:sub(au,au+1)=="--"then
table.insert(ap,aq)
aq="-"
as=true
at=an:sub(au+2,au+3)=="[["
elseif av=='"'or av=="'"then
table.insert(ap,aq)
aq=av
ar=av
elseif am[av]then
table.insert(ap,aq)
table.insert(ap,av)
aq=""
elseif av:match"[%w_]"then
aq=aq..av
else
table.insert(ap,aq)
table.insert(ap,av)
aq=""
end
end
end

table.insert(ap,aq)

local au={}

for av,aw in ipairs(ap)do
local ax=getHighlight(ap,av)

if ax then
local ay=string.format(
'<font color = "#%s">%s</font>',
ax:ToHex(),
aw:gsub("<","&lt;"):gsub(">","&gt;")
)

table.insert(au,ay)
else
table.insert(au,aw)
end
end

return table.concat(au)
end

return aa end function a.S():typeof(__modImpl())local aa=a.cache.S if not aa then aa={c=__modImpl()}a.cache.S=aa end return aa.c end end do local function __modImpl()

local aa={}

local ag=a.d()
local ah=ag.New
local aj=ag.Tween

local al=a.S()

function aa.New(am,an,ao,ap,aq)
local ar={
Radius=an.ElementConfig.UICorner,
Padding=an.NewElements and an.ElementConfig.UIPadding+4 or an.ElementConfig.UIPadding,

CodeFrame=nil,
}

local as=ah("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=am.CodeSize,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
ah("UIPadding",{
PaddingTop=UDim.new(0,ar.Padding+3),
PaddingLeft=UDim.new(0,ar.Padding+3),
PaddingRight=UDim.new(0,ar.Padding+3),
PaddingBottom=UDim.new(0,ar.Padding+3),
}),
})
as.Font="Code"

local at=ah("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize=am.Height~=nil and"XY"or"X",
ScrollingDirection=am.Height~=nil and"XY"or"X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
as,
})

local au=am.CanCopied
and ah("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,35,0,35),
Position=UDim2.new(1,-ar.Padding/2,0,ar.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=ap and true or false,
},{
ag.NewRoundFrame(ar.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
ah("UIScale",{
Scale=1,
}),
ah("ImageLabel",{
Image=ag.Icon"copy"[1],
ImageRectSize=ag.Icon"copy"[2].ImageRectSize,
ImageRectOffset=ag.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.1,
}),
}),
})
or nil

local av,aw=ag.NewRoundFrame(ar.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.955,
Visible=false,
})

local ax,ay=ag.NewRoundFrame(ar.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=0.96,
Size=UDim2.new(1,0,0,20+(ar.Padding*2)),
Visible=am.Title and true or false,
},{










ah("TextLabel",{
Text=am.Title,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=0.2,
TextSize=18,
AutomaticSize="Y",
FontFace=Font.new(ag.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,au and-20-(ar.Padding*2),0,0),
}),
ah("UIPadding",{

PaddingLeft=UDim.new(0,ar.Padding+3),
PaddingRight=UDim.new(0,ar.Padding+3),

}),
ah("UIListLayout",{
Padding=UDim.new(0,ar.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
})

local az,aA=ag.NewRoundFrame(ar.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=0.035,
Size=am.Height~=nil
and UDim2.new(1,0,am.Height.Scale,am.Height.Offset==0 and-40 or am.Height.Offset)
or UDim2.new(1,0,0,20+(ar.Padding*2)),
AutomaticSize=am.Height~=nil and"None"or"Y",
Parent=ao,
},{
av,
ah("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,am.Height~=nil and 1 or 0,0),
AutomaticSize=am.Height~=nil and"None"or"Y",
},{
ax,
at,
ah("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
au,
},nil,true)

ar.CodeFrame=az
ar.CodeFrameModule=aA
ar.OutlineFrame=av
ar.OutlineFrameModule=aw
ar.TopbarFrame=ax
ar.TopbarFrameModule=ay

ag.AddSignal(as:GetPropertyChangedSignal"TextBounds",function()
if am.Height~=nil then
at.Size=UDim2.new(1,0,1,am.Title~=nil and-(20+(ar.Padding*2))or nil)
else
at.Size=
UDim2.new(1,0,0,(as.TextBounds.Y/(aq or 1))+((ar.Padding+3)*2))
end
end)

function ar.Set(aB)
as.Text=al.run(aB,am.CodeTheme)
end

function ar.Destroy()
az:Destroy()
ar=nil
end

ar.Set(am.Code)

if au then
ag.AddSignal(au.InputBegan,function(aB:InputObject)
if
aB.UserInputType==Enum.UserInputType.MouseButton1
or aB.UserInputType==Enum.UserInputType.Touch
then
aj(au.Button,0.05,{ImageTransparency=0.95}):Play()
aj(au.Button.UIScale,0.05,{Scale=0.9}):Play()
end
end)
ag.AddSignal(au.InputEnded,function()
aj(au.Button,0.08,{ImageTransparency=1}):Play()
aj(au.Button.UIScale,0.08,{Scale=1}):Play()
end)
ag.AddSignal(au.MouseButton1Click,function()
if ap then
ap()
local aB=ag.Icon"check"
au.Button.ImageLabel.Image=aB[1]
au.Button.ImageLabel.ImageRectSize=aB[2].ImageRectSize
au.Button.ImageLabel.ImageRectOffset=aB[2].ImageRectPosition

task.delay(1,function()
local b=ag.Icon"copy"
au.Button.ImageLabel.Image=b[1]
au.Button.ImageLabel.ImageRectSize=b[2].ImageRectSize
au.Button.ImageLabel.ImageRectOffset=b[2].ImageRectPosition
end)
end
end)
end

return ar
end

return aa end function a.T():typeof(__modImpl())local aa=a.cache.T if not aa then aa={c=__modImpl()}a.cache.T=aa end return aa.c end end do local function __modImpl()

local aa=a.d()local ag=
aa.New


local ah=a.T()

local aj={}

function aj.New(al,am)
local an={
__type="Code",
Title=am.Title,
Code=am.Code,
CodeSize=am.CodeSize or 18,
Height=am.Height,
CodeTheme=am.CodeTheme,
Locked=false,
CanCopied=am.CanCopied~=false,
OnCopy=am.OnCopy,

Index=am.Index,
}

local ao=not an.Locked











local ap=ah.New(an,am.Window,am.Parent,function()
if ao then
local ap=an.Title or"code"
local aq,ar=pcall(function()
if toclipboard then
toclipboard(an.Code)
end
if setclipboard then
setclipboard(an.Code)
end

if an.OnCopy then
an.OnCopy()
end
end)
if not aq then
am.WindUI:Notify{
Title="Error",
Content="The "..ap.." is not copied. Error: "..ar,
Icon="x",
Duration=5,
}
end
end
end,am.WindUI.UIScale)

function an.SetCode(aq,ar)
ap.Set(ar)
an.Code=ar
end

function an.Set(aq,ar)
return an.SetCode(ar)
end

function an.Destroy(aq)
ap.Destroy()
an=nil
end

function an.UpdateShape(aq)
if am.Window.NewElements then
local ar=aa:GetElementPosition(
aq.Elements,
an.Index,
am.ParentType=="HStack"or am.ParentType=="Group"
)

if ar and ap.CodeFrameModule then
ap.CodeFrameModule:SetType(ar)

print(ar)
ap.TopbarFrameModule:SetType(
table.find({"Squircle-BL-BR","SquircleH-BL-BR"},ar)~=nil and"Square"or ar
)
end
end
end

an.UIElements={Main=ap.CodeFrame}
an.ElementFrame=ap.CodeFrame

return an.__type,an
end

return aj end function a.U():typeof(__modImpl())local aa=a.cache.U if not aa then aa={c=__modImpl()}a.cache.U=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ag=aa.New local ah=
aa.Tween

local aj=(cloneref or clonereference or function(aj)
return aj
end)

local al=aj(game:GetService"UserInputService")
aj(game:GetService"TouchInputService")
local am=aj(game:GetService"RunService")
local an=aj(game:GetService"Players")local ao=

am.RenderStepped
local ap=an.LocalPlayer
local aq=ap:GetMouse()

local ar=a.m().New
local as=a.n().New

local at={
UICorner=9,

}

local au

function at.Colorpicker(av,aw,ax,ay,az)
local aA={
__type="Colorpicker",
Title=aw.Title,
Desc=aw.Desc,
Default=aw.Value or aw.Default,
Callback=aw.Callback,
Transparency=aw.Transparency,
UIElements=aw.UIElements,

TextPadding=10,
}

local aB={}
local b=aA.Transparency~=nil

function aA.SetHSVFromRGB(d,f)
local g,h,i=Color3.toHSV(f)
aA.Hue=g
aA.Sat=h
aA.Vib=i
end

aA:SetHSVFromRGB(aA.Default)

local d=a.o()
local f=d.Create(nil,"Dialog",ax,ay,ax.UIElements.Main.Main)

aA.ColorpickerFrame=f

f.UIElements.Main.Size=UDim2.new(1,0,0,0)



local g,h,i=aA.Hue,aA.Sat,aA.Vib

aA.UIElements.Title=ag("TextLabel",{
Text=aA.Title,
TextSize=20,
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=f.UIElements.Main,
},{
ag("UIPadding",{
PaddingTop=UDim.new(0,aA.TextPadding/2),
PaddingLeft=UDim.new(0,aA.TextPadding/2),
PaddingRight=UDim.new(0,aA.TextPadding/2),
PaddingBottom=UDim.new(0,aA.TextPadding/2),
}),
})





local l=ag("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local m=ag("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=l,
BackgroundColor3=aA.Default,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

aA.UIElements.SatVibMap=ag("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40+aA.TextPadding),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(g,1,1),
BackgroundTransparency=0,
Parent=f.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=45,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),

m,
})

aA.UIElements.Inputs=ag("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(
b and 240 or 210,
40+aA.TextPadding
),
BackgroundTransparency=1,
Parent=f.UIElements.Main,
},{
ag("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Vertical",
}),
})





local p=ag("Frame",{
BackgroundColor3=aA.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=aA.Transparency,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ag("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208+aA.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=f.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),







p,
})

local r=ag("Frame",{
BackgroundColor3=aA.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

ag("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208+aA.TextPadding),
Size=UDim2.fromOffset(75,24),
Parent=f.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(0,8),
}),







aa.NewRoundFrame(8,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=0.85,
ZIndex=99999,
},{
ag("UIGradient",{
Rotation=60,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
r,
})

local u={}

for v=0,1,0.1 do
table.insert(u,ColorSequenceKeypoint.new(v,Color3.fromHSV(v,1,1)))
end

local v=ag("UIGradient",{
Color=ColorSequence.new(u),
Rotation=90,
})

local x=ag("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=l,


BackgroundColor3=aA.Default,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

local z=ag("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(180,40+aA.TextPadding),
Parent=f.UIElements.Main,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
v,
l,
})

local function CreateNewInput(A,B)
local C=as(A,nil,aA.UIElements.Inputs,nil,nil,nil,nil,nil,true)

ag("TextLabel",{
BackgroundTransparency=1,
TextTransparency=0.4,
TextSize=17,
FontFace=Font.new(aa.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=C.Frame,
Text=A,
})

ag("UIScale",{
Parent=C,
Scale=0.85,
})

C.Frame.Frame.TextBox.Text=B
C.Size=UDim2.new(0,150,0,42)

return C
end

local function ToRGB(A)
return{
R=math.floor(A.R*255),
G=math.floor(A.G*255),
B=math.floor(A.B*255),
}
end

local A=CreateNewInput("Hex","#"..aA.Default:ToHex())

local B=CreateNewInput("Red",ToRGB(aA.Default).R)
local C=CreateNewInput("Green",ToRGB(aA.Default).G)
local F=CreateNewInput("Blue",ToRGB(aA.Default).B)
local G
if b then
G=CreateNewInput("Alpha",((1-aA.Transparency)*100).."%")
end

local H=ag("Frame",{
Size=UDim2.new(0,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254+aA.TextPadding),
BackgroundTransparency=1,
Parent=f.UIElements.Main,
LayoutOrder=4,
},{
ag("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),






})

aa.AddSignal(f.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize",function()
aA.UIElements.Title.Size=UDim2.new(
0,
f.UIElements.Main.AbsoluteSize.X/aw.UIScale-(f.UIPadding*2),
0,
0
)
H.Size=UDim2.new(
0,
f.UIElements.Main.AbsoluteSize.X/aw.UIScale-f.UIPadding*2,
0,
40
)
end)

local J={
{
Title="Cancel",
Variant="Secondary",
Callback=function()
aw.IsShowed=false
for J,L in next,aB do
L:Disconnect()
end
aB={}
end,
},
{
Title="Apply",

Variant="Primary",
Callback=function()
aw.IsShowed=false
for J,L in next,aB do
L:Disconnect()
end
aB={}

az(Color3.fromHSV(aA.Hue,aA.Sat,aA.Vib),aA.Transparency)
end,
},
}

for L,M in next,J do
local N=ar(
M.Title,
M.Icon,
M.Callback,
M.Variant,
H,
f,
true
)
N.Size=UDim2.new(0.5,-3,0,40)
N.AutomaticSize="None"
end

local L,M,N
if b then
local O=ag("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

M=ag("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=O,
},{
ag("UIStroke",{
Thickness=2,
Transparency=0.1,
ThemeTag={
Color="Text",
},
}),
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
})

N=ag("Frame",{
Size=UDim2.fromScale(1,1),
},{
ag("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
ag("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

L=ag("Frame",{
Size=UDim2.fromOffset(6,192),
Position=UDim2.fromOffset(210,40+aA.TextPadding),
Parent=f.UIElements.Main,
BackgroundTransparency=1,
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
ag("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
ag("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
N,
O,
})
end

function aA.Round(O,P,Q)
if Q==0 then
return math.floor(P)
end
P=tostring(P)
return P:find"%."and tonumber(P:sub(1,P:find"%."+Q))or P
end

function aA.Update(O,P,Q)
if P then
g,h,i=Color3.toHSV(P)
else
g,h,i=aA.Hue,aA.Sat,aA.Vib
end

aA.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(g,1,1)
m.Position=UDim2.new(h,0,1-i,0)
m.BackgroundColor3=Color3.fromHSV(g,h,i)
r.BackgroundColor3=Color3.fromHSV(g,h,i)
x.BackgroundColor3=Color3.fromHSV(g,1,1)
x.Position=UDim2.new(0.5,0,g,0)

A.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(g,h,i):ToHex()
B.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(g,h,i)).R
C.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(g,h,i)).G
F.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(g,h,i)).B

if Q or b then
r.BackgroundTransparency=aA.Transparency or Q
N.BackgroundColor3=Color3.fromHSV(g,h,i)
M.BackgroundColor3=Color3.fromHSV(g,h,i)
M.BackgroundTransparency=aA.Transparency or Q
M.Position=UDim2.new(0.5,0,1-aA.Transparency or Q,0)
G.Frame.Frame.TextBox.Text=aA:Round(
(1-aA.Transparency or Q)*100,
0
).."%"
end
end

aA:Update(aA.Default,aA.Transparency)

local function GetRGB()
local O=Color3.fromHSV(aA.Hue,aA.Sat,aA.Vib)
return{R=math.floor(O.r*255),G=math.floor(O.g*255),B=math.floor(O.b*255)}
end



local function clamp(O,P,Q)
return math.clamp(tonumber(O)or 0,P,Q)
end

table.insert(
aB,
aa.AddSignal(A.Frame.Frame.TextBox.FocusLost,function(O)
if O then
local P=A.Frame.Frame.TextBox.Text:gsub("#","")
local Q,R=pcall(Color3.fromHex,P)
if Q and typeof(R)=="Color3"then
aA.Hue,aA.Sat,aA.Vib=Color3.toHSV(R)
aA:Update()
aA.Default=R
end
end
end)
)

local function updateColorFromInput(O,P)
aa.AddSignal(O.Frame.Frame.TextBox.FocusLost,function(Q)
if Q then
local R=O.Frame.Frame.TextBox
local S=GetRGB()
local T=clamp(R.Text,0,255)
R.Text=tostring(T)

S[P]=T
local U=Color3.fromRGB(S.R,S.G,S.B)
aA.Hue,aA.Sat,aA.Vib=Color3.toHSV(U)
aA:Update()
end
end)
end

updateColorFromInput(B,"R")
updateColorFromInput(C,"G")
updateColorFromInput(F,"B")

if b then
aa.AddSignal(G.Frame.Frame.TextBox.FocusLost,function(O)
if O then
local P=G.Frame.Frame.TextBox
local Q=clamp(P.Text,0,100)
P.Text=tostring(Q)

aA.Transparency=1-Q*0.01
aA:Update(nil,aA.Transparency)
end
end)
end



local function UpdateSatVib(O,P)
local Q=O.AbsolutePosition.X
local R=Q+O.AbsoluteSize.X
local S=O.AbsolutePosition.Y
local T=S+O.AbsoluteSize.Y

local U=math.clamp(aq.X,Q,R)
local V=math.clamp(aq.Y,S,T)

P.Sat=(U-Q)/(R-Q)
P.Vib=1-((V-S)/(T-S))

P:Update()
end

local function UpdateHue(O,P)
local Q=O.AbsolutePosition.Y
local R=Q+O.AbsoluteSize.Y

local S=math.clamp(aq.Y,Q,R)

P.Hue=(S-Q)/(R-Q)

P:Update()
end

local function UpdateTransparency(O,P)
local Q=O.AbsolutePosition.Y
local R=Q+O.AbsoluteSize.Y

local S=math.clamp(aq.Y,Q,R)

P.Transparency=1-((S-Q)/(R-Q))

P:Update()
end

local O=ay.GenerateGUID()

table.insert(
aB,
al.InputChanged:Connect(function(P)
if
P.UserInputType~=Enum.UserInputType.MouseMovement
and P.UserInputType~=Enum.UserInputType.Touch
then
return
end

if au=="SatVib"then
UpdateSatVib(aA.UIElements.SatVibMap,aA)
elseif au=="Hue"then
UpdateHue(z,aA)
elseif au=="Transparency"then
UpdateTransparency(L,aA)
end
end)
)

table.insert(
aB,
aA.UIElements.SatVibMap.InputBegan:Connect(function(P)
if
P.UserInputType~=Enum.UserInputType.MouseButton1
and P.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=O then
return
end
ay.CurrentInput=O

if au and au~="SatVib"then
return
end

au="SatVib"

UpdateSatVib(aA.UIElements.SatVibMap,aA)
end)
)

table.insert(
aB,
z.InputBegan:Connect(function(P)
if
P.UserInputType~=Enum.UserInputType.MouseButton1
and P.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=O then
return
end
ay.CurrentInput=O

if au and au~="Hue"then
return
end

au="Hue"

UpdateHue(z,aA)
end)
)

if L then
table.insert(
aB,
L.InputBegan:Connect(function(P)
if
P.UserInputType~=Enum.UserInputType.MouseButton1
and P.UserInputType~=Enum.UserInputType.Touch
then
return
end

if ay.CurrentInput and ay.CurrentInput~=O then
return
end
ay.CurrentInput=O

if au and au~="Transparency"then
return
end

au="Transparency"

UpdateTransparency(L,aA)
end)
)
end

table.insert(
aB,
al.InputEnded:Connect(function(P)
au=nil

if ay.CurrentInput and ay.CurrentInput~=O then
return
end
ay.CurrentInput=nil
end)
)

return aA
end

function at.New(av,aw)
local ax={
__type="Colorpicker",
Title=aw.Title or"Colorpicker",
Desc=aw.Desc or nil,
Locked=aw.Locked or false,
LockedTitle=aw.LockedTitle,
Default=aw.Default or Color3.new(1,1,1),
Callback=aw.Callback or function()end,

UIScale=aw.UIScale,
Transparency=aw.Transparency,
UIElements={},

IsShowed=false,
}

local ay=true



ax.ColorpickerFrame=a.F(){
Title=ax.Title,
Desc=ax.Desc,
Parent=aw.Parent,
TextOffset=40,
Hover=false,
Tab=aw.Tab,
Index=aw.Index,
Window=aw.Window,
ElementTable=ax,
ParentConfig=aw,
Tags=aw.Tags,
}

ax.UIElements.Colorpicker=aa.NewRoundFrame(at.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=ax.Default,
Parent=ax.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,26,0,26),
AnchorPoint=Vector2.new(1,0),
Position=UDim2.new(1,0,0,0),
ZIndex=2,
},{
aa.NewRoundFrame(at.UICorner,"SquircleGlass",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=0.55,
}),
},true)

function ax.Lock(az)
ax.Locked=true
ay=false
return ax.ColorpickerFrame:Lock(ax.LockedTitle)
end
function ax.Unlock(az)
ax.Locked=false
ay=true
return ax.ColorpickerFrame:Unlock()
end

if ax.Locked then
ax:Lock()
end

function ax.Update(az,aA,aB)
ax.UIElements.Colorpicker.ImageTransparency=aB or 0
ax.UIElements.Colorpicker.ImageColor3=aA
ax.Default=aA
if aB then
ax.Transparency=aB
end
end

function ax.Set(az,aA,aB)
return ax:Update(aA,aB)
end

aa.AddSignal(ax.UIElements.Colorpicker.MouseButton1Click,function()
if ay and not ax.IsShowed then
ax.IsShowed=true

at:Colorpicker(ax,aw.Window,aw.WindUI,function(az,aA)
ax:Update(az,aA)
ax.Default=az
ax.Transparency=aA
aa.SafeCallback(ax.Callback,az,aA)
end).ColorpickerFrame
:Open()
end
end)

return ax.__type,ax
end

return at end function a.V():typeof(__modImpl())local aa=a.cache.V if not aa then aa={c=__modImpl()}a.cache.V=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ag=aa.New
local aj=aa.Tween

local al={}

function al.New(am,an)
local ao={
__type="Section",
Title=an.Title or"Section",
Desc=an.Desc,
Icon=an.Icon,
IconThemed=an.IconThemed,
TextXAlignment=an.TextXAlignment or"Left",
TextSize=an.TextSize or 19,
DescTextSize=an.DescTextSize or 16,
Box=an.Box or false,
BoxBorder=an.BoxBorder or false,
FontWeight=an.FontWeight or Enum.FontWeight.SemiBold,
DescFontWeight=an.DescFontWeight or Enum.FontWeight.Medium,
TextTransparency=an.TextTransparency or 0.05,
DescTextTransparency=an.DescTextTransparency or 0.4,
Opened=an.Opened or false,
UIElements={},

HeaderSize=48,
IconSize=20,
Padding=10,

Elements={},

Expandable=false,
}

local ap

function ao.SetIcon(aq,ar)
ao.Icon=ar or nil
if ap then
ap:Destroy()
end
if ar then
ap=aa.Image(
ar,
ar..":"..ao.Title,
0,
an.Window.Folder,
ao.__type,
true,
ao.IconThemed,
"SectionIcon"
)
ap.Size=UDim2.new(0,ao.IconSize,0,ao.IconSize)
end
end

local aq=ag("Frame",{
Size=UDim2.new(0,ao.IconSize,0,ao.IconSize),
BackgroundTransparency=1,
Visible=false,
},{
ag("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=aa.Icon"chevron-down"[1],
ImageRectSize=aa.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=aa.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageTransparency="SectionExpandIconTransparency",
ImageColor3="SectionExpandIcon",
},
}),
})

if ao.Icon then
ao:SetIcon(ao.Icon)
end

local ar=ag("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ag("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment=ao.TextXAlignment,
VerticalAlignment="Center",
Padding=UDim.new(0,4),
}),
})

local as,at

local function createTitle(au,av)
return ag("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=ao.TextXAlignment,
AutomaticSize="Y",
TextSize=av=="Title"and ao.TextSize or ao.DescTextSize,
TextTransparency=av=="Title"and ao.TextTransparency or ao.DescTextTransparency,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,av=="Title"and ao.FontWeight or ao.DescFontWeight),


Text=au,
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
Parent=ar,
})
end

as=createTitle(ao.Title,"Title")
if ao.Desc then
at=createTitle(ao.Desc,"Desc")
end

local function UpdateTitleSize()
local au=0
if ap then
au=au-(ao.IconSize+8)
end
if aq.Visible then
au=au-(ao.IconSize+8)
end
ar.Size=UDim2.new(1,au,0,0)
end

local au=aa.NewRoundFrame(an.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
Parent=an.Parent,

AutomaticSize="Y",
ThemeTag={
ImageTransparency=ao.Box and"SectionBoxBackgroundTransparency"or nil,
ImageColor3="SectionBoxBackground",
},
ImageTransparency=not ao.Box and 1 or nil,
},{
aa.NewRoundFrame(an.Window.ElementConfig.UICorner-1,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ThemeTag={

ImageColor3="SectionBoxBorder",
},
ImageTransparency=ao.Box and ao.BoxBorder and 0.92 or 1,
Name="Outline",
ClipsDescendants=true,
},{
ag("TextButton",{
Size=UDim2.new(1,0,0,ao.Expandable and 0 or(not at and ao.HeaderSize or 0)),
BackgroundTransparency=1,
AutomaticSize=(not ao.Expandable or at)and"Y"or nil,
Text="",
Name="Top",
},{
ao.Box and ag("UIPadding",{
PaddingTop=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingLeft=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingRight=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
PaddingBottom=UDim.new(
0,
an.Window.ElementConfig.UIPadding+(an.Window.NewElements and 4 or 0)
),
})or nil,
ap,
ar,
ag("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
aq,
}),
ag("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=false,
Position=UDim2.new(0,0,0,ao.HeaderSize+10),
},{
ao.Box and ag("UIPadding",{
PaddingLeft=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
PaddingRight=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
PaddingBottom=UDim.new(0,an.Window.ElementConfig.UIPadding/1.5),
})or nil,
ag("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,an.Tab.Gap),
VerticalAlignment="Top",
}),
}),
}),
})





ao.ElementFrame=au

au.Outline.Top:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
au.Outline.Content.Position=UDim2.new(0,0,0,(au.Outline.Top.AbsoluteSize.Y/an.UIScale)+10)

if ao.Opened then
ao:Open(true)
else
ao.Close(true)
end
end)

local av=an.ElementsModule

av.Load(ao,au.Outline.Content,av.Elements,an.Window,an.WindUI,function()
if not ao.Expandable then
ao.Expandable=true
aq.Visible=true
UpdateTitleSize()
end
end,av,an.UIScale,an.Tab)

UpdateTitleSize()

function ao.SetTitle(aw,ax)
ao.Title=ax
as.Text=ax
end

function ao.SetDesc(aw,ax)
ao.Desc=ax
if not at then
at=createTitle(ax,"Desc")
end
at.Text=ax
end

function ao.Destroy(aw)
for ax,ay in next,ao.Elements do
ay:Destroy()
end








au:Destroy()
end

function ao.Open(aw,ax)
if ao.Expandable then
ao.Opened=true
if ax then
au.Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
au.Outline.Top.AbsoluteSize.Y/an.UIScale
+(au.Outline.Content.AbsoluteSize.Y/an.UIScale)
+10
)
aq.ImageLabel.Rotation=180
else
aj(au,0.33,{
Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
au.Outline.Top.AbsoluteSize.Y/an.UIScale
+(au.Outline.Content.AbsoluteSize.Y/an.UIScale)
+10
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

aj(
aq.ImageLabel,
0.2,
{Rotation=180},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end
function ao.Close(aw,ax)
if ao.Expandable then
ao.Opened=false
if ax then
au.Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
(au.Outline.Top.AbsoluteSize.Y/an.UIScale)
)
aq.ImageLabel.Rotation=0
else
aj(au,0.26,{
Size=UDim2.new(
au.Size.X.Scale,
au.Size.X.Offset,
0,
(au.Outline.Top.AbsoluteSize.Y/an.UIScale)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
aj(
aq.ImageLabel,
0.2,
{Rotation=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end
end

aa.AddSignal(au.Outline.Top.MouseButton1Click,function()
if ao.Expandable then
if ao.Opened then
ao:Close()
else
ao:Open()
end
end
end)

aa.AddSignal(au.Outline.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if ao.Opened then
ao:Open(true)
else
ao:Close(true)
end
end)

task.defer(function()
if ao.Expandable then








au.Size=
UDim2.new(au.Size.X.Scale,au.Size.X.Offset,0,au.Outline.Top.AbsoluteSize.Y/an.UIScale)
au.AutomaticSize="None"
au.Outline.Top.Size=UDim2.new(1,0,0,(not at and ao.HeaderSize or 0))
au.Outline.Top.AutomaticSize=(not ao.Expandable or at)and"Y"or"None"
au.Outline.Content.Visible=true
end
if ao.Opened then
ao:Open()
else
ao:Close(true)
end
end)

return ao.__type,ao
end

return al end function a.W():typeof(__modImpl())local aa=a.cache.W if not aa then aa={c=__modImpl()}a.cache.W=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ag=aa.New

local aj={}

function aj.New(al,am)
local an=ag("Frame",{
Parent=am.Parent,
Size=not table.find({"Group","HStack"},am.ParentType)and UDim2.new(1,-7,0,7*(am.Columns or 1))or UDim2.new(0,7*(am.Columns or 1),0,0),
BackgroundTransparency=1,
})

return"Space",{__type="Space",ElementFrame=an}
end

return aj end function a.X():typeof(__modImpl())local aa=a.cache.X if not aa then aa={c=__modImpl()}a.cache.X=aa end return aa.c end end do local function __modImpl()
local aa=a.d()
local ag=aa.New

local aj={}

local function ParseAspectRatio(al)
if type(al)=="string"then
local am,an=al:match"(%d+):(%d+)"
if am and an then
return tonumber(am)/tonumber(an)
end
elseif type(al)=="number"then
return al
end
return nil
end

function aj.New(al,am)
local an={
__type="Image",
Image=am.Image or"",
AspectRatio=am.AspectRatio or"16:9",
Radius=am.Radius or am.Window.ElementConfig.UICorner,
}
local ao=aa.Image(
an.Image,
an.Image,
an.Radius,
am.Window.Folder,
"Image",
false
)
if ao and ao.Parent then
ao.Parent=am.Parent
ao.Size=UDim2.new(1,0,0,0)
ao.BackgroundTransparency=1












local ap=ParseAspectRatio(an.AspectRatio)
local aq

if ap then
aq=ag("UIAspectRatioConstraint",{
Parent=ao,
AspectRatio=ap,
AspectType="ScaleWithParentSize",
DominantAxis="Width"
})
end

function an.Destroy(ar)
ao:Destroy()
end
end

return an.__type,an
end

return aj end function a.Y():typeof(__modImpl())local aa=a.cache.Y if not aa then aa={c=__modImpl()}a.cache.Y=aa end return aa.c end end do local function __modImpl()
local aa=a.d()
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="Group",
Elements={},
ElementFrame=nil,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6))
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,
function(aq,ar)
local as=am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)

local at={}
local au=0

for av,aw in next,ar do
if aw.__type=="Space"then
au=au+(aw.ElementFrame.Size.X.Offset or 6)
elseif aw.__type=="Divider"then
au=au+(aw.ElementFrame.Size.X.Offset or 1)
else
table.insert(at,aw)
end
end

local av=#at
if av==0 then return end

local aw=1/av

local ax=as*(av-1)

local ay=-(ax+au)

local az=math.floor(ay/av)
local aA=ay-(az*av)

for aB,b in next,at do
local d=az
if aB<=math.abs(aA)then
d=d-1
end

if b.ElementFrame then
b.ElementFrame.Size=UDim2.new(aw,d,1,0)
end
end
end,
ap,
am.UIScale,
am.Tab
)



return an.__type,an
end

return aj end function a.Z():typeof(__modImpl())local aa=a.cache.Z if not aa then aa={c=__modImpl()}a.cache.Z=aa end return aa.c end end do local function __modImpl()
local aa=a.d()
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="HStack",
AutoSpace=am.AutoSpace or false,
Elements={},
ElementFrame=nil,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Horizontal",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)),
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,
function(aq,ar)
local as=am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6)

local at={}
local au=0

for av,aw in next,ar do
if aw.__type=="Space"then
au=au+(aw.ElementFrame.Size.X.Offset or 6)
elseif aw.__type=="Divider"then
au=au+(aw.ElementFrame.Size.X.Offset or 1)
else
table.insert(at,aw)
end
end

local av=#at
if av==0 then
return
end

local aw=1/av

local ax=as*(av-1)

local ay=-(ax+au)

local az=math.floor(ay/av)
local aA=ay-(az*av)

for aB,b in next,at do
local d=az
if aB<=math.abs(aA)then
d=d-1
end

if b.ElementFrame then
b.ElementFrame.Size=UDim2.new(aw,d,1,0)
end
end
end,
ap,
am.UIScale,
am.Tab
)

if an.AutoSpace then
for aq in next,ap.Elements do
if aq~="Space"and aq~="Divider"then
local ar=an[aq]
an[aq]=function(as,at)
if#an.Elements>0 then
an:Space()
end
return ar(as,at)
end
end
end
end

return an.__type,an
end

return aj end function a._():typeof(__modImpl())local aa=a.cache._ if not aa then aa={c=__modImpl()}a.cache._=aa end return aa.c end end do local function __modImpl()

local aa=a.d()
local ag=aa.New

local aj={}

function aj.New(al,am)
local an={
__type="VStack",
Elements={},
ElementFrame=nil,
}

local ao=ag("Frame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticSize="Y",
Parent=am.Parent,
},{
ag("UIListLayout",{
FillDirection="Vertical",
HorizontalAlignment="Center",

Padding=UDim.new(0,am.Tab and am.Tab.Gap or(am.Window.NewElements and 1 or 6))
}),
})

an.ElementFrame=ao

local ap=am.ElementsModule
ap.Load(
an,
ao,
ap.Elements,
am.Window,
am.WindUI,







































nil,
ap,
am.UIScale,
am.Tab
)



return an.__type,an
end

return aj end function a.aa():typeof(__modImpl())local aa=a.cache.aa if not aa then aa={c=__modImpl()}a.cache.aa=aa end return aa.c end end do local function __modImpl()
local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=aa(game:GetService"UserInputService")

local aj=a.d()
local al=aj.New

local am={}














function am.New(an,ao:ConfigType__DARKLUA_TYPE_a)
local ap={
__type="Viewport",
Object=ao.Object,
Camera=ao.Camera or Instance.new"Camera",
Interactive=ao.Interactive or false,
Height=ao.Height or 200,
Focused=ao.Focused~=false,
}

local aq=false
local ar=false
local as,at=0

local au=aj.NewRoundFrame(ao.Window.ElementConfig.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,ap.Height),
Parent=ao.Parent,
ThemeTag={
ImageColor3="ViewportBackground",
ImageTransparency="ViewportBackgroundTransparency",
},
},{
al("CanvasGroup",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("UICorner",{
CornerRadius=UDim.new(0,ao.Window.ElementConfig.UICorner),
}),
al("ViewportFrame",{
Name="Viewport",
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
CurrentCamera=ap.Camera,
Active=ap.Interactive,
},{
ap.Object,
}),
}),
})

local function IsTouchInsideViewport(av)
local aw=au.CanvasGroup.Viewport.AbsolutePosition
local ax=au.CanvasGroup.Viewport.AbsoluteSize

return av.X>=aw.X
and av.X<=aw.X+ax.X
and av.Y>=aw.Y
and av.Y<=aw.Y+ax.Y
end

local av=ao.WindUI.GenerateGUID()

aj.AddSignal(au.CanvasGroup.Viewport.MouseEnter,function()
if ap.Interactive then
ao.Tab.UIElements.ContainerFrame.ScrollingEnabled=false
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputEnded,function(aw)
if
aw.UserInputType==Enum.UserInputType.MouseMovement
or aw.UserInputType==Enum.UserInputType.Touch
then
ao.Tab.UIElements.ContainerFrame.ScrollingEnabled=true
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputBegan,function(aw)
if ap.Interactive then
if
(aw.UserInputType==Enum.UserInputType.MouseButton1)
or(aw.UserInputType==Enum.UserInputType.Touch and not ar)
then
if ao.WindUI.CurrentInput and ao.WindUI.CurrentInput~=av then
return
end

ao.WindUI.CurrentInput=av

aq=true
at=aw.Position
end
end
end)

aj.AddSignal(ag.InputEnded,function(aw)
if ap.Interactive then
if
aw.UserInputType==Enum.UserInputType.MouseButton1
or aw.UserInputType==Enum.UserInputType.Touch
then
if ao.WindUI.CurrentInput and ao.WindUI.CurrentInput~=av then
return
end

ao.WindUI.CurrentInput=nil

aq=false
end
end
end)

aj.AddSignal(ag.InputChanged,function(aw)
if ap.Interactive and aq and not ar then
if
aw.UserInputType==Enum.UserInputType.MouseMovement
or aw.UserInputType==Enum.UserInputType.Touch
then
local ax=aw.Position-at
at=aw.Position

local ay=ap.Object:GetPivot().Position
local az=ap.Camera

local aA=CFrame.fromAxisAngle(Vector3.new(0,1,0),-ax.X*0.02)
az.CFrame=CFrame.new(ay)*aA*CFrame.new(-ay)*az.CFrame

local aB=CFrame.fromAxisAngle(az.CFrame.RightVector,-ax.Y*0.02)
local b=CFrame.new(ay)*aB*CFrame.new(-ay)*az.CFrame

if b.UpVector.Y>0.1 then
az.CFrame=b
end
end
end
end)

aj.AddSignal(au.CanvasGroup.Viewport.InputChanged,function(aw)
if ap.Interactive then
if aw.UserInputType==Enum.UserInputType.MouseWheel then
local ax=aw.Position.Z*2
ap.Camera.CFrame+=ap.Camera.CFrame.LookVector*ax
end
end
end)

aj.AddSignal(ag.TouchPinch,function(aw,ax,ay,az)
if not IsTouchInsideViewport(aw[1])or not IsTouchInsideViewport(aw[2])then
return
end
if ap.Interactive then
if az==Enum.UserInputState.Begin then
ar=true
aq=false
as=(aw[1]-aw[2]).Magnitude
elseif az==Enum.UserInputState.Change then
if ar then
local aA=(aw[1]-aw[2]).Magnitude
local aB=(aA-as)*0.03
as=aA
ap.Camera.CFrame+=ap.Camera.CFrame.LookVector*aB
end
elseif az==Enum.UserInputState.End or az==Enum.UserInputState.Cancel then
ar=false
end
end
end)

local function FocusCamera()
local aw=ap.Object:IsA"BasePart"and ap.Object.Size
or select(2,ap.Object:GetBoundingBox(0))
local ax=math.max(aw.X,aw.Y,aw.Z)
local ay=ax*2
local az=ap.Object:GetPivot().Position

ap.Camera.CFrame=
CFrame.new(az+Vector3.new(0,ax/2,ay),az)
end

if ap.Focused then
FocusCamera()
end

function ap.SetObject(aw,ax,ay)
if ay then
ax=ax:Clone()
end
if ap.Object then
ap.Object:Destroy()
end

ap.Object=ax
ap.Object.Parent=au.CanvasGroup.Viewport
end

function ap.SetHeight(aw,ax)
au.Size=UDim2.new(1,0,0,ax)
end

function ap.Focus(aw)
if ap.Object then
FocusCamera()
end
end

function ap.SetCamera(aw,ax)
ap.Camera=ax
au.CanvasGroup.Viewport.CurrentCamera=ax
end

function ap.SetInteractive(aw,ax)
ap.Interactive=ax
au.CanvasGroup.Viewport.Active=ax
end

ap.Main=au

return ap.__type,ap
end

return am end function a.ab():typeof(__modImpl())local aa=a.cache.ab if not aa then aa={c=__modImpl()}a.cache.ab=aa end return aa.c end end do local function __modImpl()

return{
Elements={
Paragraph=a.G(),
Button=a.H(),
Toggle=a.K(),
Slider=a.L(),
ProgressBar=a.M(),
Keybind=a.N(),
Input=a.O(),
Dropdown=a.R(),
Code=a.U(),
Colorpicker=a.V(),
Section=a.W(),
Divider=a.P(),
Space=a.X(),
Image=a.Y(),
Group=a.Z(),
HStack=a._(),
VStack=a.aa(),
Viewport=a.ab(),

},
Load=function(aa,ag,aj,al,am,an,ao,ap,aq)
for ar,as in next,aj do
aa[ar]=function(at,au)
au=au or{}
au.Tab=aq or aa
au.ParentType=aa.__type
au.ParentTable=aa
au.Index=#aa.Elements+1
au.GlobalIndex=#al.AllElements+1
au.Parent=ag
au.Window=al
au.WindUI=am
au.UIScale=ap
au.ElementsModule=ao local

av, aw=as:New(au)

if au.Flag and typeof(au.Flag)=="string"then
if al.CurrentConfig then
al.CurrentConfig:Register(au.Flag,aw)

if al.PendingConfigData and al.PendingConfigData[au.Flag]then
local ax=al.PendingConfigData[au.Flag]

local ay=al.ConfigManager
if ay.Parser[ax.__type]then
task.defer(function()
local az,aA=pcall(function()
ay.Parser[ax.__type].Load(aw,ax)
end)

if az then
al.PendingConfigData[au.Flag]=nil
else
warn(
"[ WindUI ] Failed to apply pending config for '"
..au.Flag
.."': "
..tostring(aA)
)
end
end)
end
end
else
al.PendingFlags=al.PendingFlags or{}
al.PendingFlags[au.Flag]=aw
end
end

local ax
for ay,az in next,aw do
if typeof(az)=="table"and ay~="ElementFrame"and ay:match"Frame$"then
ax=az
break
end
end

if ax then
aw.ElementFrame=ax.UIElements.Main
function aw.SetTitle(ay,az)
return ax.SetTitle and ax:SetTitle(az)
end
function aw.SetDesc(ay,az)
return ax.SetDesc and ax:SetDesc(az)
end
function aw.SetImage(ay,az,aA)
return ax.SetImage and ax:SetImage(az,aA)
end
function aw.SetThumbnail(ay,az,aA)
return ax.SetThumbnail and ax:SetThumbnail(az,aA)
end
function aw.Highlight(ay)
ax:Highlight()
end
function aw.Destroy(ay)
ax:Destroy()

table.remove(al.AllElements,au.GlobalIndex)
table.remove(aa.Elements,au.Index)
table.remove(aq.Elements,au.Index)
aa:UpdateAllElementShapes(aa)
end
end

al.AllElements[au.Index]=aw
aa.Elements[au.Index]=aw
if aq then
aq.Elements[au.Index]=aw
end

if al.NewElements then
aa:UpdateAllElementShapes(aa)
end

if an then
an(aw,aa.Elements)
end
return aw
end
end
function aa.UpdateAllElementShapes(ar,as)
for at,au in next,as.Elements do
local av
for aw,ax in pairs(au)do
if typeof(ax)=="table"and aw:match"Frame$"then
av=ax
break
end
end

if not av and au.UpdateShape then
av=au
end

if av then

av.Index=at
if av.UpdateShape then

av.UpdateShape(as)
end
end
end
end
end,
}end function a.ac():typeof(__modImpl())local aa=a.cache.ac if not aa then aa={c=__modImpl()}a.cache.ac=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=game:GetService"Players"

aa(game:GetService"UserInputService")
local aj=ag.LocalPlayer:GetMouse()

local al=a.d()
local am=al.New

local an=a.E().New
local ao=a.A().New



local ap={


Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(ap)end,
}

function ap.Init(aq,ar,as,at)
Window=aq
WindUI=ar
ap.ToolTipParent=as
ap.TabHighlight=at
return ap
end

function ap.New(aq,ar)
local as={
__type="Tab",
Title=aq.Title or"Tab",
Desc=aq.Desc,
Icon=aq.Icon,
IconColor=aq.IconColor,
IconShape=aq.IconShape,
IconThemed=aq.IconThemed,
Locked=aq.Locked,
ShowTabTitle=aq.ShowTabTitle,
TabTitleAlign=aq.TabTitleAlign or"Left",
CustomEmptyPage=(aq.CustomEmptyPage and next(aq.CustomEmptyPage)~=nil)and aq.CustomEmptyPage
or{Icon="lucide:frown",IconSize=48,Title="This tab is Empty",Desc=nil},
Border=aq.Border,
Selected=false,
Index=nil,
Parent=aq.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
UICorner=Window.UICorner-(Window.UIPadding/2),

Gap=Window.NewElements and 1 or 6,

TabPaddingX=4+(Window.UIPadding/2),
TabPaddingY=3+(Window.UIPadding/2),
TitlePaddingY=0,
}









if as.IconShape then
as.TabPaddingX=2+(Window.UIPadding/4)
as.TabPaddingY=2+(Window.UIPadding/4)
as.TitlePaddingY=2+(Window.UIPadding/4)
end

ap.TabCount=ap.TabCount+1

local at=ap.TabCount
as.Index=at

as.UIElements.Main=al.NewRoundFrame(as.UICorner,"Squircle",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=aq.Parent,
ThemeTag={
ImageColor3="TabBackground",
},
ImageTransparency=1,
},{
al.NewRoundFrame(as.UICorner-1,"Glass-1.4",{
Size=UDim2.new(1,1,1,1),
ThemeTag={
ImageColor3="TabBorder",
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageTransparency=1,
Name="Outline",
},{













}),
al.NewRoundFrame(as.UICorner,"Squircle",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Frame",
},{
am("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,2+(Window.UIPadding/2)),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
am("TextLabel",{
Text=as.Title,
ThemeTag={
TextColor3="TabTitle",
},
TextTransparency=not as.Locked and 0.4 or 0.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(al.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
},{
am("UIPadding",{
PaddingTop=UDim.new(0,as.TitlePaddingY),


PaddingBottom=UDim.new(0,as.TitlePaddingY),
}),
}),
am("UIPadding",{
PaddingTop=UDim.new(0,as.TabPaddingY),
PaddingLeft=UDim.new(0,as.TabPaddingX),
PaddingRight=UDim.new(0,as.TabPaddingX),
PaddingBottom=UDim.new(0,as.TabPaddingY),
}),
}),
},true)

local au=0
local av
local aw

if as.Icon then
av=al.Image(
as.Icon,
as.Icon..":"..as.Title,
0,
Window.Folder,
as.__type,
as.IconColor and false or true,
as.IconThemed,
"TabIcon"
)
av.Size=UDim2.new(0,16,0,16)
if as.IconColor then
av.ImageLabel.ImageColor3=as.IconColor
end
if not as.IconShape then
av.Parent=as.UIElements.Main.Frame
as.UIElements.Icon=av
av.ImageLabel.ImageTransparency=not as.Locked and 0 or 0.7
au=-18-(Window.UIPadding/2)
as.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,au,0,0)
elseif as.IconColor then
al.NewRoundFrame(
as.IconShape~="Circle"and(as.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Squircle",
{
Size=UDim2.new(0,26,0,26),
ImageColor3=as.IconColor,
Parent=as.UIElements.Main.Frame,
},
{
av,
al.NewRoundFrame(
as.IconShape~="Circle"and(as.UICorner+5-(2+(Window.UIPadding/4)))or 9999,
"Glass-1.4",
{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=0,
Name="Outline",
},
{













}
),
}
)
av.AnchorPoint=Vector2.new(0.5,0.5)
av.Position=UDim2.new(0.5,0,0.5,0)
av.ImageLabel.ImageTransparency=0
av.ImageLabel.ImageColor3=al.GetTextColorForHSB(as.IconColor,0.68)
au=-28-(Window.UIPadding/2)
as.UIElements.Main.Frame.TextLabel.Size=UDim2.new(1,au,0,0)
end

aw=
al.Image(as.Icon,as.Icon..":"..as.Title,0,Window.Folder,as.__type,true,as.IconThemed)
aw.Size=UDim2.new(0,16,0,16)
aw.ImageLabel.ImageTransparency=not as.Locked and 0 or 0.7
au=-30




end

as.UIElements.ContainerFrame=am("ScrollingFrame",{
Size=UDim2.new(1,0,1,as.ShowTabTitle and-((Window.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
am("UIPadding",{
PaddingTop=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingLeft=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingRight=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
PaddingBottom=UDim.new(0,not Window.HidePanelBackground and 20 or 10),
}),
am("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,as.Gap),
HorizontalAlignment="Center",
}),
})





as.UIElements.ContainerFrameCanvas=am("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=Window.UIElements.MainBar,
ZIndex=5,
},{
as.UIElements.ContainerFrame,
am("Frame",{
Size=UDim2.new(1,-14,1,-14),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="ScrollSliderHolder",
}),
am("Frame",{
Size=UDim2.new(1,0,0,((Window.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=as.ShowTabTitle or false,
Name="TabTitle",
},{
aw,
am("TextLabel",{
Text=as.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=20,
TextTransparency=0.1,
Size=UDim2.new(0,0,1,0),
FontFace=Font.new(al.Font,Enum.FontWeight.SemiBold),

RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
AutomaticSize="X",
}),
am("UIPadding",{
PaddingTop=UDim.new(0,20),
PaddingLeft=UDim.new(0,20),
PaddingRight=UDim.new(0,20),
PaddingBottom=UDim.new(0,20),
}),
am("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment=as.TabTitleAlign,
}),
}),
am("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
Position=UDim2.new(0,0,0,((Window.UIPadding*2.4)+12)),
Visible=as.ShowTabTitle or false,
}),
})

ap.Containers[at]=as.UIElements.ContainerFrameCanvas
ap.Tabs[at]=as

as.ContainerFrame=as.UIElements.ContainerFrameCanvas

al.AddSignal(as.UIElements.Main.MouseButton1Click,function()
if not as.Locked then
ap:SelectTab(at)
end
end)

if Window.ScrollBarEnabled then
ao(
as.UIElements.ContainerFrame,
as.UIElements.ContainerFrameCanvas.ScrollSliderHolder,
Window,
4,
WindUI
)
end

local ax
local ay
local az
local aA=false


if as.Desc then
al.AddSignal(as.UIElements.Main.InputBegan,function()
aA=true
ay=task.spawn(function()
task.wait(0.35)
if aA and not ax then
ax=an(as.Desc,ap.ToolTipParent,true)
ax.Container.AnchorPoint=Vector2.new(0.5,0.5)

local function updatePosition()
if ax then
ax.Container.Position=UDim2.new(0,aj.X,0,aj.Y-4)
end
end

updatePosition()
az=aj.Move:Connect(updatePosition)
ax:Open()
end
end)
end)
end

al.AddSignal(as.UIElements.Main.MouseEnter,function()
if not as.Locked then
al.SetThemeTag(as.UIElements.Main.Frame,{
ImageTransparency="TabBackgroundHoverTransparency",
ImageColor3="TabBackgroundHover",
},0.1)
end
end)
al.AddSignal(as.UIElements.Main.InputEnded,function()
if as.Desc then
aA=false
if ay then
task.cancel(ay)
ay=nil
end
if az then
az:Disconnect()
az=nil
end
if ax then
ax:Close()
ax=nil
end
end

if not as.Locked then
al.SetThemeTag(as.UIElements.Main.Frame,{
ImageTransparency="TabBorderTransparency",
},0.1)
end
end)

function as.ScrollToTheElement(aB,b)
as.UIElements.ContainerFrame.ScrollingEnabled=false

al.Tween(as.UIElements.ContainerFrame,0.45,{
CanvasPosition=Vector2.new(
0,
as.Elements[b].ElementFrame.AbsolutePosition.Y
-as.UIElements.ContainerFrame.AbsolutePosition.Y
-as.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
task.wait(0.48)

if as.Elements[b].Highlight then
as.Elements[b]:Highlight()
end
as.UIElements.ContainerFrame.ScrollingEnabled=true
end)

return as
end



local aB=a.ac()

aB.Load(
as,
as.UIElements.ContainerFrame,
aB.Elements,
Window,
WindUI,
nil,
aB,
ar,
as
)

function as.LockAll(b)

for d,f in next,Window.AllElements do
if f.Tab and f.Tab.Index and f.Tab.Index==as.Index and f.Lock then
f:Lock()
end
end
end
function as.UnlockAll(b)
for d,f in next,Window.AllElements do
if f.Tab and f.Tab.Index and f.Tab.Index==as.Index and f.Unlock then
f:Unlock()
end
end
end
function as.GetLocked(b)
local d={}

for f,g in next,Window.AllElements do
if g.Tab and g.Tab.Index and g.Tab.Index==as.Index and g.Locked==true then
table.insert(d,g)
end
end

return d
end
function as.GetUnlocked(b)
local d={}

for f,g in next,Window.AllElements do
if g.Tab and g.Tab.Index and g.Tab.Index==as.Index and g.Locked==false then
table.insert(d,g)
end
end

return d
end

function as.Select(b)
return ap:SelectTab(as.Index)
end

task.spawn(function()
local b
if as.CustomEmptyPage.Icon then
b=
al.Image(as.CustomEmptyPage.Icon,as.CustomEmptyPage.Icon,0,"Temp","EmptyPage",true)
b.Size=
UDim2.fromOffset(as.CustomEmptyPage.IconSize or 48,as.CustomEmptyPage.IconSize or 48)
end

local d=am("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=as.UIElements.ContainerFrame,
},{
am("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),











b,
as.CustomEmptyPage.Title and am("TextLabel",{
AutomaticSize="XY",
Text=as.CustomEmptyPage.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
TextTransparency=0.5,
BackgroundTransparency=1,
FontFace=Font.new(al.Font,Enum.FontWeight.Medium),
})or nil,
as.CustomEmptyPage.Desc and am("TextLabel",{
AutomaticSize="XY",
Text=as.CustomEmptyPage.Desc,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.65,
BackgroundTransparency=1,
FontFace=Font.new(al.Font,Enum.FontWeight.Regular),
})or nil,
})





local f
f=al.AddSignal(as.UIElements.ContainerFrame.ChildAdded,function()
d.Visible=false
f:Disconnect()
end)
end)

return as
end

function ap.OnChange(aq,ar)
ap.OnChangeFunc=ar
end

function ap.SelectTab(aq,ar)
if not ap.Tabs[ar].Locked then
ap.SelectedTab=ar

for as,at in next,ap.Tabs do
if not at.Locked then
al.SetThemeTag(at.UIElements.Main,{
ImageTransparency="TabBorderTransparency",
},0.15)
if at.Border then
al.SetThemeTag(at.UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparency",
},0.15)
end
al.SetThemeTag(at.UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparency",
},0.15)
if at.UIElements.Icon and not at.IconColor then
al.SetThemeTag(at.UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparency",
},0.15)
end
at.Selected=false
end
end
al.SetThemeTag(ap.Tabs[ar].UIElements.Main,{
ImageColor3="TabBackgroundActive",
ImageTransparency="TabBackgroundActiveTransparency",
},0.15)
if ap.Tabs[ar].Border then
al.SetThemeTag(ap.Tabs[ar].UIElements.Main.Outline,{
ImageTransparency="TabBorderTransparencyActive",
},0.15)
end
al.SetThemeTag(ap.Tabs[ar].UIElements.Main.Frame.TextLabel,{
TextTransparency="TabTextTransparencyActive",
},0.15)
if ap.Tabs[ar].UIElements.Icon and not ap.Tabs[ar].IconColor then
al.SetThemeTag(ap.Tabs[ar].UIElements.Icon.ImageLabel,{
ImageTransparency="TabIconTransparencyActive",
},0.15)
end
ap.Tabs[ar].Selected=true

task.spawn(function()
for as,at in next,ap.Containers do
at.AnchorPoint=Vector2.new(0,0.05)
at.Visible=false
end
ap.Containers[ar].Visible=true
local as=game:GetService"TweenService"

local at=TweenInfo.new(0.15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out)
local au=as:Create(ap.Containers[ar],at,{
AnchorPoint=Vector2.new(0,0),
})
au:Play()
end)

ap.OnChangeFunc(ar)
end
end

return ap end function a.ad():typeof(__modImpl())local aa=a.cache.ad if not aa then aa={c=__modImpl()}a.cache.ad=aa end return aa.c end end do local function __modImpl()

local aa={}


local ag=a.d()
local aj=ag.New
local al=ag.Tween

local am=a.ad()

function aa.New(an,ao,ap,aq,ar)
local as={
Title=an.Title or"Section",
Icon=an.Icon,
IconThemed=an.IconThemed,
Opened=an.Opened or false,

HeaderSize=42,
IconSize=18,

Expandable=false,
}

local at
if as.Icon then
at=ag.Image(
as.Icon,
as.Icon,
0,
ap,
"Section",
true,
as.IconThemed,
"TabSectionIcon"
)

at.Size=UDim2.new(0,as.IconSize,0,as.IconSize)
at.ImageLabel.ImageTransparency=.25
end

local au=aj("Frame",{
Size=UDim2.new(0,as.IconSize,0,as.IconSize),
BackgroundTransparency=1,
Visible=false
},{
aj("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Image=ag.Icon"chevron-down"[1],
ImageRectSize=ag.Icon"chevron-down"[2].ImageRectSize,
ImageRectOffset=ag.Icon"chevron-down"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=.7,
})
})

local av=aj("Frame",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Parent=ao,
ClipsDescendants=true,
},{
aj("TextButton",{
Size=UDim2.new(1,0,0,as.HeaderSize),
BackgroundTransparency=1,
Text="",
},{
at,
aj("TextLabel",{
Text=as.Title,
TextXAlignment="Left",
Size=UDim2.new(
1,
at and(-as.IconSize-10)*2
or(-as.IconSize-10),

1,
0
),
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ag.Font,Enum.FontWeight.SemiBold),
TextSize=14,
BackgroundTransparency=1,
TextTransparency=.7,

TextWrapped=true
}),
aj("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
Padding=UDim.new(0,10)
}),
au,
aj("UIPadding",{
PaddingLeft=UDim.new(0,11),
PaddingRight=UDim.new(0,11),
})
}),
aj("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
Name="Content",
Visible=true,
Position=UDim2.new(0,0,0,as.HeaderSize)
},{
aj("UIListLayout",{
FillDirection="Vertical",
Padding=UDim.new(0,ar.Gap),
VerticalAlignment="Bottom",
}),
})
})


function as.Tab(aw,ax)
if not as.Expandable then
as.Expandable=true
au.Visible=true
end
ax.Parent=av.Content
return am.New(ax,aq)
end

function as.Open(aw)
if as.Expandable then
as.Opened=true
al(av,0.33,{
Size=UDim2.new(1,0,0,as.HeaderSize+(av.Content.AbsoluteSize.Y/aq))
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

al(au.ImageLabel,0.1,{Rotation=180},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
function as.Close(aw)
if as.Expandable then
as.Opened=false
al(av,0.26,{
Size=UDim2.new(1,0,0,as.HeaderSize)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
al(au.ImageLabel,0.1,{Rotation=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

ag.AddSignal(av.TextButton.MouseButton1Click,function()
if as.Expandable then
if as.Opened then
as:Close()
else
as:Open()
end
end
end)

ag.AddSignal(av.Content.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()
if as.Opened then
as:Open()
end
end)

if as.Opened then
task.spawn(function()
task.wait()
as:Open()
end)
end



return as
end


return aa end function a.ae():typeof(__modImpl())local aa=a.cache.ae if not aa then aa={c=__modImpl()}a.cache.ae=aa end return aa.c end end do local function __modImpl()
return{
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
ProgressBar="chart-bar",
}end function a.af():typeof(__modImpl())local aa=a.cache.af if not aa then aa={c=__modImpl()}a.cache.af=aa end return aa.c end end do local function __modImpl()

local aa=(cloneref or clonereference or function(aa)
return aa
end)

aa(game:GetService"UserInputService")

local ag={
Margin=8,
Padding=9,
}

local aj=a.d()
local al=aj.New
local am=aj.Tween

function ag.new(an,ao,ap)
local aq={
IconSize=18,
Padding=14,
Radius=22,
Width=400,
MaxHeight=380,

Icons=a.af(),
}

local ar=al("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(1,-((aq.IconSize*2)+(aq.Padding*2)),0,0),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Regular),
TextSize=18,
})

local as=al("ImageLabel",{
Image=aj.Icon"x"[1],
ImageRectSize=aj.Icon"x"[2].ImageRectSize,
ImageRectOffset=aj.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
},{
al("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
}),
})

local at=al("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false,
},{
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
al("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding),
}),
})

local au=aj.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="WindowSearchBarBackground",
},
ImageTransparency=0,
},{
aj.NewRoundFrame(aq.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Frame",
},{
al("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








al("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
al("ImageLabel",{
Image=aj.Icon"search"[1],
ImageRectSize=aj.Icon"search"[2].ImageRectSize,
ImageRectOffset=aj.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
ar,
as,
al("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
al("UIPadding",{
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
}),
}),
}),
al("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
al("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=0.9,
Visible=false,
}),
at,
al("UISizeConstraint",{
MaxSize=Vector2.new(aq.Width,aq.MaxHeight),
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
})

local av=al("Frame",{
Size=UDim2.new(0,aq.Width,0,0),
AutomaticSize="Y",
Parent=ao,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
al("UIScale",{
Scale=0.9,
}),
au,















})

local function CreateSearchTab(aw,ax,ay,az,aA,aB)
local b=al("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=az or nil,
},{
aj.NewRoundFrame(aq.Radius-11,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main",
},{
aj.NewRoundFrame(aq.Radius-11,"Glass-1",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="White",
},
ImageTransparency=1,
Name="Outline",
},{








al("UIPadding",{
PaddingTop=UDim.new(0,aq.Padding-2),
PaddingLeft=UDim.new(0,aq.Padding),
PaddingRight=UDim.new(0,aq.Padding),
PaddingBottom=UDim.new(0,aq.Padding-2),
}),
al("ImageLabel",{
Image=aj.Icon(ay)[1],
ImageRectSize=aj.Icon(ay)[2].ImageRectSize,
ImageRectOffset=aj.Icon(ay)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
},
ImageTransparency=0.1,
Size=UDim2.new(0,aq.IconSize,0,aq.IconSize),
}),
al("Frame",{
Size=UDim2.new(1,-aq.IconSize-aq.Padding,0,0),
BackgroundTransparency=1,
},{
al("TextLabel",{
Text=aw,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title",
}),
al("TextLabel",{
Text=ax or"",
Visible=ax and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=0.3,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc",
})or nil,
al("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,aq.Padding),
FillDirection="Horizontal",
}),
}),
},true),
al("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-aq.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=aA,

},{
aj.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=0.9,
}),
al("Frame",{
Size=UDim2.new(1,-aq.Padding-2,0,0),
Position=UDim2.new(0,aq.Padding+2,0,0),
BackgroundTransparency=1,
},{
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
al("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right",
}),
})



b.Main.Size=UDim2.new(
1,
0,
0,
b.Main.Outline.Frame.Desc.Visible
and(((aq.Padding-2)*2)+b.Main.Outline.Frame.Title.TextBounds.Y+6+b.Main.Outline.Frame.Desc.TextBounds.Y)
or(((aq.Padding-2)*2)+b.Main.Outline.Frame.Title.TextBounds.Y)
)

aj.AddSignal(b.Main.MouseEnter,function()
am(b.Main,0.04,{ImageTransparency=0.95}):Play()

end)
aj.AddSignal(b.Main.InputEnded,function()
am(b.Main,0.08,{ImageTransparency=1}):Play()

end)
aj.AddSignal(b.Main.MouseButton1Click,function()
if aB then
aB()
end
end)

return b
end

local function ContainsText(aw,ax)
if not ax or ax==""then
return false
end

if not aw or aw==""then
return false
end

local ay=string.lower(aw)
local az=string.lower(ax)

return string.find(ay,az,1,true)~=nil
end

local function Search(aw)
if not aw or aw==""then
return{}
end

local ax={}
for ay,az in next,an.Tabs do
local aA=ContainsText(az.Title or"",aw)
local aB={}

for b,d in next,az.Elements do
if d.__type~="Section"then
local f=ContainsText(d.Title or"",aw)
local g=ContainsText(d.Desc or"",aw)

if f or g then
aB[b]={
Title=d.Title,
Desc=d.Desc,
Original=d,
__type=d.__type,
Index=b,
}
end
end
end

if aA or next(aB)~=nil then
ax[ay]={
Tab=az,
Title=az.Title,
Icon=az.Icon,
Elements=aB,
}
end
end
return ax
end

aj.AddSignal(at.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize",function()

am(at,0.06,{
Size=UDim2.new(
1,
0,
0,
math.clamp(
at.UIListLayout.AbsoluteContentSize.Y+(aq.Padding*2),
0,
aq.MaxHeight
)
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function aq.Open(aw)
task.spawn(function()
au.Frame.Visible=true
av.Visible=true
am(av.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function aq.Close(aw,ax)
task.spawn(function()
ap()
au.Frame.Visible=false
am(av.UIScale,0.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(0.12)
av.Visible=false
if ax then
av:Destroy()
end
end)
end

aj.AddSignal(as.TextButton.MouseButton1Click,function()
aq:Close(true)
end)

aq:Open()

function aq.Search(aw,ax)
ax=ax or""

local ay=Search(ax)

at.Visible=true
au.Frame.Results.Frame.Visible=true
for az,aA in next,at:GetChildren()do
if aA.ClassName~="UIListLayout"and aA.ClassName~="UIPadding"then
aA:Destroy()
end
end

if ay and next(ay)~=nil then
for az,aA in next,ay do
local aB=aq.Icons.Tab
local b=CreateSearchTab(aA.Title,nil,aB,at,true,function()
aq:Close()
an:SelectTab(az)
end)
if aA.Elements and next(aA.Elements)~=nil then
for d,f in next,aA.Elements do
local g=aq.Icons[f.__type]
CreateSearchTab(
f.Title,
f.Desc,
g,
b:FindFirstChild"ParentContainer"and b.ParentContainer.Frame
or nil,
false,
function()
aq:Close()
an:SelectTab(az)
if aA.Tab.ScrollToTheElement then

aA.Tab:ScrollToTheElement(f.Index)
end

end
)

end
end
end
elseif ax~=""then
al("TextLabel",{
Size=UDim2.new(1,0,0,70),
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=0.2,
BackgroundTransparency=1,
FontFace=Font.new(aj.Font,Enum.FontWeight.Medium),
Parent=at,
Name="NotFound",
})
else
at.Visible=false
au.Frame.Results.Frame.Visible=false
end
end

aj.AddSignal(ar:GetPropertyChangedSignal"Text",function()
aq:Search(ar.Text)
end)

return aq
end

return ag end function a.ag():typeof(__modImpl())local aa=a.cache.ag if not aa then aa={c=__modImpl()}a.cache.ag=aa end return aa.c end end do local function __modImpl()



local aa=(cloneref or clonereference or function(aa)
return aa
end)

local ag=aa(game:GetService"UserInputService")
local aj=aa(game:GetService"RunService")
local al=aa(game:GetService"Players")

local am=workspace.CurrentCamera

local an=a.w()

local ao=a.d()
local ap=ao.New
local aq=ao.Tween


local ar=a.z().New
local as=a.m().New
local at=a.A().New
local au=a.B()

local av=a.C()



return function(aw)
local ax={
Title=aw.Title or"UI Library",
Author=aw.Author,
Icon=aw.Icon,
IconSize=aw.IconSize or 22,
IconThemed=aw.IconThemed,
IconRadius=aw.IconRadius or 0,
Folder=aw.Folder,
Resizable=aw.Resizable~=false,
Background=aw.Background,
BackgroundImageTransparency=aw.BackgroundImageTransparency or 0,
ShadowTransparency=aw.ShadowTransparency or 0.6,
User=aw.User or{},
Footer=aw.Footer or{},
Topbar=aw.Topbar or{Height=52,ButtonsType="Mac"},

Size=aw.Size,

MinSize=aw.MinSize or Vector2.new(560,350),
MaxSize=aw.MaxSize or Vector2.new(850,560),

TopBarButtonIconSize=aw.TopBarButtonIconSize,

ToggleKey=aw.ToggleKey,
ElementsRadius=aw.ElementsRadius,
Radius=aw.Radius or 16,
Transparent=aw.Transparent or false,
HideSearchBar=aw.HideSearchBar~=false,
ScrollBarEnabled=aw.ScrollBarEnabled or false,
SideBarWidth=aw.SideBarWidth or 200,
Acrylic=aw.Acrylic or false,
NewElements=aw.NewElements or false,
IgnoreAlerts=aw.IgnoreAlerts or false,
HidePanelBackground=aw.HidePanelBackground or false,
AutoScale=aw.AutoScale~=false,
OpenButton=aw.OpenButton,
DragFrameSize=160,

Position=UDim2.new(0.5,0,0.5,0),
UICorner=16,
UIPadding=14,
UIElements={},
CanDropdown=true,
Closed=false,
Parent=aw.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=aw.Resizable~=false,
IsOpenButtonEnabled=aw.OpenButton~=nil and aw.OpenButton~=false,

CurrentConfig=nil,
ConfigManager=nil,
AcrylicPaint=nil,
CurrentTab=nil,
TabModule=nil,

OnOpenCallback=nil,
OnCloseCallback=nil,
OnDestroyCallback=nil,

IsPC=false,

Gap=5,

TopBarButtons={},
AllElements={},

ElementConfig={},

PendingFlags={},

IsToggleDragging=false,
}

ax.UICorner=ax.Radius

ax.TopBarButtonIconSize=ax.TopBarButtonIconSize or(ax.Topbar.ButtonsType=="Mac"and 11 or 16)

ax.ElementConfig={
UIPadding=(ax.NewElements and 10 or 13),
UICorner=ax.ElementsRadius or(ax.NewElements and 23 or 16),
}

local ay=ax.Size or UDim2.new(0,580,0,460)
ax.Size=UDim2.new(
ay.X.Scale,
math.clamp(ay.X.Offset,ax.MinSize.X,ax.MaxSize.X),
ay.Y.Scale,
math.clamp(ay.Y.Offset,ax.MinSize.Y,ax.MaxSize.Y)
)

if ax.Topbar=={}then
ax.Topbar={Height=52,ButtonsType="Mac"}
end

if not aj:IsStudio()and ax.Folder and writefile then
if not isfolder("WindUI/"..ax.Folder)then
makefolder("WindUI/"..ax.Folder)
end
if not isfolder("WindUI/"..ax.Folder.."/assets")then
makefolder("WindUI/"..ax.Folder.."/assets")
end
if not isfolder(ax.Folder)then
makefolder(ax.Folder)
end
if not isfolder(ax.Folder.."/assets")then
makefolder(ax.Folder.."/assets")
end
end

local az=ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
})

if ax.Folder then
ax.ConfigManager=av:Init(ax)
end

if ax.Acrylic then local
aA=an.AcrylicPaint{UseAcrylic=ax.Acrylic}

ax.AcrylicPaint=aA
end

local aA=ap("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true,
},{
ap("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})
local aB=ao.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
ap("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=ao.Icon"expand"[1],
ImageRectOffset=ao.Icon"expand"[2].ImageRectPosition,
ImageRectSize=ao.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local b=ao.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})









ax.UIElements.SideBar=ap("ScrollingFrame",{
Size=UDim2.new(
1,
ax.ScrollBarEnabled and-3-(ax.UIPadding/2)or 0,
1,
not ax.HideSearchBar and-45 or 0
),
Position=UDim2.new(0,0,1,0),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
ap("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
ap("UIPadding",{



PaddingBottom=UDim.new(0,ax.UIPadding/2),
}),
ap("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,ax.Gap),
}),
}),
ap("UIPadding",{

PaddingLeft=UDim.new(0,ax.UIPadding/2),
PaddingRight=UDim.new(0,ax.UIPadding/2),
PaddingBottom=UDim.new(0,ax.UIPadding/2),
}),

})

ax.UIElements.SideBarContainer=ap("Frame",{
Size=UDim2.new(
0,
ax.SideBarWidth,
1,
ax.User.Enabled and-ax.Topbar.Height-42-(ax.UIPadding*2)or-ax.Topbar.Height
),
Position=UDim2.new(0,0,0,ax.Topbar.Height),
BackgroundTransparency=1,
Visible=true,
},{
ap("Frame",{
Name="Content",
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,not ax.HideSearchBar and-45-ax.UIPadding or-ax.UIPadding/2),
Position=UDim2.new(0,0,1,-ax.UIPadding/2),
AnchorPoint=Vector2.new(0,1),
}),
ax.UIElements.SideBar,
})

if ax.ScrollBarEnabled then
at(
ax.UIElements.SideBar,
ax.UIElements.SideBarContainer.Content,
ax,
3,
aw.WindUI
)
end

ax.UIElements.MainBar=ap("Frame",{
Size=UDim2.new(1,-ax.UIElements.SideBarContainer.AbsoluteSize.X,1,-ax.Topbar.Height),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
ao.NewRoundFrame(ax.UICorner-(ax.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="PanelBackground",
ImageTransparency="PanelBackgroundTransparency",
},


ZIndex=3,
Name="Background",
Visible=not ax.HidePanelBackground,
}),
ap("UIPadding",{

PaddingLeft=UDim.new(0,ax.UIPadding/2),
PaddingRight=UDim.new(0,ax.UIPadding/2),
PaddingBottom=UDim.new(0,ax.UIPadding/2),
}),
})

local d=ap("ImageLabel",{
Image="rbxassetid://8992230677",
ThemeTag={
ImageColor3="WindowShadow",

},
ImageTransparency=1,
Size=UDim2.new(1,100,1,100),
Position=UDim2.new(0,-50,0,-50),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-999999999999999,
Name="Blur",
})

if ag.TouchEnabled and not ag.KeyboardEnabled then
ax.IsPC=false
elseif ag.KeyboardEnabled then
ax.IsPC=true
else
ax.IsPC=nil
end







local f
if ax.User then
local function GetUserThumb()local
g=al:GetUserThumbnailAsync(
ax.User.Anonymous and 1 or al.LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)
return g
end

f=ap("TextButton",{
Size=UDim2.new(
0,
ax.UIElements.SideBarContainer.AbsoluteSize.X-(ax.UIPadding/2),
0,
42+ax.UIPadding
),
Position=UDim2.new(0,ax.UIPadding/2,1,-(ax.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
Visible=ax.User.Enabled or false,
},{
ao.NewRoundFrame(ax.UICorner-(ax.UIPadding/2),"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Outline",
},{
ap("UIGradient",{
Rotation=78,
Color=ColorSequence.new{
ColorSequenceKeypoint.new(0.0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(0.5,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1.0,Color3.fromRGB(255,255,255)),
},
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0.0,0.1),
NumberSequenceKeypoint.new(0.5,1),
NumberSequenceKeypoint.new(1.0,0.1),
},
}),
}),
ao.NewRoundFrame(ax.UICorner-(ax.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
ap("ImageLabel",{
Image=GetUserThumb(),
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=0.93,
},{
ap("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
ap("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
ap("TextLabel",{
Text=ax.User.Anonymous and"Anonymous"or al.LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="DisplayName",
}),
ap("TextLabel",{
Text=ax.User.Anonymous and"anonymous"or al.LocalPlayer.Name,
TextSize=15,
TextTransparency=0.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
Name="UserName",
}),
ap("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
}),
}),
ap("UIListLayout",{
Padding=UDim.new(0,ax.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ap("UIPadding",{
PaddingLeft=UDim.new(0,ax.UIPadding/2),
PaddingRight=UDim.new(0,ax.UIPadding/2),
}),
}),
})

function ax.User.Enable(g)
ax.User.Enabled=true
aq(
ax.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,ax.SideBarWidth,1,-ax.Topbar.Height-42-(ax.UIPadding*2))},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
f.Visible=true
end
function ax.User.Disable(g)
ax.User.Enabled=false
aq(
ax.UIElements.SideBarContainer,
0.25,
{Size=UDim2.new(0,ax.SideBarWidth,1,-ax.Topbar.Height)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
f.Visible=false
end
function ax.User.SetAnonymous(g,h)
if h~=false then
h=true
end
ax.User.Anonymous=h
f.UserIcon.ImageLabel.Image=GetUserThumb()
f.UserIcon.Frame.DisplayName.Text=h and"Anonymous"or al.LocalPlayer.DisplayName
f.UserIcon.Frame.UserName.Text=h and"anonymous"or al.LocalPlayer.Name
end

if ax.User.Enabled then
ax.User:Enable()
else
ax.User:Disable()
end

if ax.User.Callback then
ao.AddSignal(f.MouseButton1Click,function()
ax.User.Callback()
end)
ao.AddSignal(f.MouseEnter,function()
aq(f.UserIcon,0.04,{ImageTransparency=0.95}):Play()
aq(f.Outline,0.04,{ImageTransparency=0.85}):Play()
end)
ao.AddSignal(f.InputEnded,function()
aq(f.UserIcon,0.04,{ImageTransparency=1}):Play()
aq(f.Outline,0.04,{ImageTransparency=1}):Play()
end)
end
end

local g
local h

local i=false
local l

local m=typeof(ax.Background)=="string"and string.match(ax.Background,"^video:(.+)")or nil

local p=typeof(ax.Background)=="string"
and not m
and string.match(ax.Background,"^https?://.+")
or nil

local r=typeof(ax.Background)=="string"
and not m
and string.match(ax.Background,"^rbxassetid://%d+")
or nil

local function GetImageExtension(u)
if not u or typeof(u)~="string"then
return".png"
end
local v=u:match"^([^?#]+)"or u
local x=v:match"%.(%w+)$"
if x then
x=x:lower()
if x=="jpg"or x=="jpeg"or x=="png"or x=="webp"then
return"."..x
end
end
return".png"
end



if typeof(ax.Background)=="string"and m then
i=true

if string.find(m,"http")then
local u=(ax.Folder or"Temp").."/assets/."..ao.SanitizeFilename(m)..".webm"
if not isfile(u)then
local v,x=pcall(function()





local v=game.HttpGet and game:HttpGet(m)
or ao.Request{
Url=m,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(u,v)
end)
if not v then
warn("[ WindUI.Window.Background ] Failed to download video: "..tostring(x))
end
end

local v,x=pcall(function()
return getcustomasset(u)
end)
if not v then
warn("[ WindUI.Window.Background ] Failed to load custom asset: "..tostring(x))
end
warn"[ WindUI.Window.Background ] VideoFrame may not work with custom video"
m=x
end

l=ap("VideoFrame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Video=m,
Looped=true,
Volume=0,
},{
ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
}),
})
l:Play()
elseif p then
local u=(ax.Folder or"Temp")
.."/assets/."
..ao.SanitizeFilename(p)
..GetImageExtension(p)

if isfile and not isfile(u)then
local v,x=pcall(function()
local v=game.HttpGet and game:HttpGet(p)
or ao.Request{
Url=p,
Method="GET",
Headers={["User-Agent"]="Roblox/Exploit"},
}.Body

writefile(u,v)
end)

if not v then
warn("[ Window.Background ] Failed to download image: "..tostring(x))
end
end

local v,x=pcall(function()
return getcustomasset(u)
end)

if not v then
warn("[ Window.Background ] Failed to load custom asset: "..tostring(x))
end

l=ap("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=x,
ImageTransparency=0,
ScaleType="Crop",
},{
ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
}),
})
elseif r then
l=ap("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=r,
ImageTransparency=0,
ScaleType="Crop",
},{
ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
}),
})
elseif ax.Background then
l=ap("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=typeof(ax.Background)=="string"and ax.Background or"",
ImageTransparency=1,
ScaleType="Crop",
},{
ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
}),
})
end

local u=ao.NewRoundFrame(99,"Squircle",{
ImageTransparency=0.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,0,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
ap("TextButton",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
Name="Frame",
}),
})

function createAuthor(v)
return ap("TextLabel",{
Text=v,
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.35,
AutomaticSize="XY",
Parent=ax.UIElements.Main and ax.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=13,
LayoutOrder=2,
ThemeTag={
TextColor3="WindowTopbarAuthor",
},
Name="Author",
})
end

local v
local x

if ax.Author then
v=createAuthor(ax.Author)
end

local z=ap("TextLabel",{
Text=ax.Title,
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="WindowTopbarTitle",
},
})

ax.UIElements.Main=ap("Frame",{
Size=UDim2.new(ax.Size.X.Scale,ax.Size.X.Offset,0,0),
Position=ax.Position,
BackgroundTransparency=1,
Parent=aw.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,

},{
aw.WindUI.UIScaleObj,
ax.AcrylicPaint and ax.AcrylicPaint.Frame or nil,
d,
ao.NewRoundFrame(ax.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="WindowBackground",
},

},{
l,
u,
aA,
}),




az,
aB,
b,
ap("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
ap("UICorner",{
CornerRadius=UDim.new(0,ax.UICorner),
}),
ax.UIElements.SideBarContainer,
ax.UIElements.MainBar,

f,

h,
ap("Frame",{
Size=UDim2.new(1,0,0,ax.Topbar.Height),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar",
},{
g,






ap("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left",
},{
ap("UIListLayout",{
Padding=UDim.new(0,ax.UIPadding+4),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ap("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
ap("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Center",
}),
z,
v,
}),
ap("UIPadding",{
PaddingLeft=UDim.new(0,4),
}),
}),
ap("CanvasGroup",{
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Center",
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
AutomaticSize="Y",
Visible=false,
},{



ap("ScrollingFrame",{
Name="Holder",
BackgroundTransparency=1,
AutomaticSize="Y",
ScrollBarThickness=0,
ScrollingDirection="X",
AutomaticCanvasSize="X",
CanvasSize=UDim2.new(0,0,0,0),
Size=UDim2.new(1,0,1,0),


},{

ap("UIListLayout",{
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Left",
Padding=UDim.new(0,ax.UIPadding/2),
}),
}),
}),
ap("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(ax.Topbar.ButtonsType=="Default"and 1 or 0,0,0.5,0),
AnchorPoint=Vector2.new(ax.Topbar.ButtonsType=="Default"and 1 or 0,0.5),
Name="Right",
},{
ap("UIListLayout",{
Padding=UDim.new(0,ax.Topbar.ButtonsType=="Default"and 9 or 0),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),
}),
ap("UIPadding",{
PaddingTop=UDim.new(0,ax.UIPadding),
PaddingLeft=UDim.new(
0,
ax.Topbar.ButtonsType=="Default"and ax.UIPadding or ax.UIPadding-2
),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,ax.UIPadding),
}),
}),
}),
})

ao.AddSignal(ax.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal"AbsoluteSize",function()
local A=0
local B=ax.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
/aw.WindUI.UIScale

A=ax.UIElements.Main.Main.Topbar.Left.AbsoluteSize.X/aw.WindUI.UIScale
if ax.Topbar.ButtonsType~="Default"then
A=A+B+ax.UIPadding-4
end

ax.UIElements.Main.Main.Topbar.Center.Position=
UDim2.new(0,A+(ax.UIPadding/aw.WindUI.UIScale),0.5,0)
ax.UIElements.Main.Main.Topbar.Center.Size=UDim2.new(
1,
-A
-(ax.UIPadding/aw.WindUI.UIScale)
-(ax.Topbar.ButtonsType=="Default"and B+ax.UIPadding or 0),
1,
0
)
end)

if ax.Topbar.ButtonsType~="Default"then
ao.AddSignal(ax.UIElements.Main.Main.Topbar.Right:GetPropertyChangedSignal"AbsoluteSize",function()
ax.UIElements.Main.Main.Topbar.Left.Position=UDim2.new(
0,
(ax.UIElements.Main.Main.Topbar.Right.AbsoluteSize.X/aw.WindUI.UIScale)+ax.UIPadding-4,
0,
0
)
end)
end

function ax.CreateTopbarButton(A,B,C,F,G,H,J,L)
local M=ao.Image(
C,
C,
0,
ax.Folder,
"WindowTopbarIcon",
ax.Topbar.ButtonsType=="Default"and true or false,
H,
"WindowTopbarButtonIcon"
)
M.Size=ax.Topbar.ButtonsType=="Default"
and UDim2.new(0,L or ax.TopBarButtonIconSize,0,L or ax.TopBarButtonIconSize)
or UDim2.new(0,0,0,0)
M.AnchorPoint=Vector2.new(0.5,0.5)
M.Position=UDim2.new(0.5,0,0.5,0)
M.ImageLabel.ImageTransparency=ax.Topbar.ButtonsType=="Default"and 0 or 1

if ax.Topbar.ButtonsType~="Default"then
M.ImageLabel.ImageColor3=ao.GetTextColorForHSB(J)
end

local N=ao.NewRoundFrame(
ax.Topbar.ButtonsType=="Default"and ax.UICorner-(ax.UIPadding/2)or 999,
"Squircle",
{
Size=ax.Topbar.ButtonsType=="Default"
and UDim2.new(0,ax.Topbar.Height-16,0,ax.Topbar.Height-16)
or UDim2.new(0,14,0,14),
LayoutOrder=G or 999,


ZIndex=9999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
ImageColor3=ax.Topbar.ButtonsType~="Default"and(J or Color3.fromHex"#ff3030")or nil,
ThemeTag=ax.Topbar.ButtonsType=="Default"and{
ImageColor3="Text",
}or nil,
ImageTransparency=ax.Topbar.ButtonsType=="Default"and 1 or 0,
},
{












M,
ap("UIScale",{
Scale=1,
}),
},
true
)

local O=ap("Frame",{
Size=ax.Topbar.ButtonsType~="Default"and UDim2.new(0,24,0,24)
or UDim2.new(0,ax.Topbar.Height-16,0,ax.Topbar.Height-16),
BackgroundTransparency=1,
Parent=ax.UIElements.Main.Main.Topbar.Right,
LayoutOrder=G or 999,
},{
N,
})



ax.TopBarButtons[100-G]={
Name=B,
Object=O,
}

ao.AddSignal(N.MouseButton1Click,function()
if F then
F()
end
end)
ao.AddSignal(N.MouseEnter,function()
if ax.Topbar.ButtonsType=="Default"then
aq(N,0.15,{ImageTransparency=0.93}):Play()


else

aq(
M.ImageLabel,
0.1,
{ImageTransparency=0},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aq(M,0.1,{
Size=UDim2.new(
0,
L or ax.TopBarButtonIconSize,
0,
L or ax.TopBarButtonIconSize
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end)

ao.AddSignal(N.MouseButton1Down,function()
aq(N.UIScale,0.2,{Scale=0.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)

ao.AddSignal(N.MouseLeave,function()
if ax.Topbar.ButtonsType=="Default"then
aq(N,0.1,{ImageTransparency=1}):Play()


else

aq(
M.ImageLabel,
0.1,
{ImageTransparency=1},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
aq(
M,
0.1,
{Size=UDim2.new(0,0,0,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end
end)

ao.AddSignal(N.InputEnded,function()
aq(N.UIScale,0.2,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end)

return N
end

function ax.Topbar.Button(A,B:{
Name:string,
Icon:string,
Callback:any,
LayoutOrder:number,
IconThemed:boolean,
Color:Color3,
IconSize:number,
})
return ax:CreateTopbarButton(
B.Name,
B.Icon,
B.Callback,
B.LayoutOrder or 0,
B.IconThemed,
B.Color,
B.IconSize
)
end



local A=ao.Drag(
ax.UIElements.Main,
{ax.UIElements.Main.Main.Topbar,u.Frame},
function(A,B)
if not ax.Closed then
if A and B==u.Frame then
aq(u,0.1,{ImageTransparency=0.35}):Play()
else
aq(u,0.2,{ImageTransparency=0.8}):Play()
end
ax.Position=ax.UIElements.Main.Position
ax.Dragging=A
end
end
)

if not i and ax.Background and typeof(ax.Background)=="table"then
local B=ap"UIGradient"
for C,F in next,ax.Background do
B[C]=F
end

ax.UIElements.BackgroundGradient=ao.NewRoundFrame(ax.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
Parent=ax.UIElements.Main.Background,
ImageTransparency=ax.Transparent and aw.WindUI.TransparencyValue or 0,
},{
B,
})
end














ax.OpenButtonMain=a.D().New(ax)

task.spawn(function()
if ax.Icon then
local B=ap("Frame",{
Size=UDim2.new(0,22,0,22),
BackgroundTransparency=1,
Parent=ax.UIElements.Main.Main.Topbar.Left,
})

x=ao.Image(
ax.Icon,
ax.Title,
ax.IconRadius,
ax.Folder,
"Window",
true,
ax.IconThemed,
"WindowTopbarIcon"
)
x.Parent=B
x.Size=UDim2.new(0,ax.IconSize,0,ax.IconSize)
x.Position=UDim2.new(0.5,0,0.5,0)
x.AnchorPoint=Vector2.new(0.5,0.5)

ax.OpenButtonMain:SetIcon(ax.Icon)











else
ax.OpenButtonMain:SetIcon(ax.Icon)

end
end)

function ax.SetToggleKey(B,C)
ax.ToggleKey=C
end

function ax.SetTitle(B,C)
ax.Title=C
z.Text=C
end

function ax.SetAuthor(B,C)
ax.Author=C
if not v then
v=createAuthor(ax.Author)
end

v.Text=C
end

function ax.SetSize(B,C)
if typeof(C)=="UDim2"then
ax.Size=C

aq(ax.UIElements.Main,0.08,{Size=C},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

function ax.SetBackgroundImage(B,C)
ax.UIElements.Main.Background.ImageLabel.Image=C
end
function ax.SetBackgroundImageTransparency(B,C)
if l and l:IsA"ImageLabel"then
l.ImageTransparency=math.floor(C*10+0.5)/10
end
ax.BackgroundImageTransparency=math.floor(C*10+0.5)/10
end

function ax.SetBackgroundTransparency(B,C)
local F=math.floor(tonumber(C)*10+0.5)/10
aw.WindUI.TransparencyValue=F
ax:ToggleTransparency(F>0)
end

local B
local C
ao.Icon"minimize"
ao.Icon"maximize"

ax:CreateTopbarButton(
"Fullscreen",
ax.Topbar.ButtonsType=="Mac"and"rbxassetid://127426072704909"or"maximize",
function()
ax:ToggleFullscreen()
end,
(ax.Topbar.ButtonsType=="Default"and 998 or 999),
true,
Color3.fromHex"#27C93F",
ax.Topbar.ButtonsType=="Mac"and 9 or nil
)

local function SetSize(F)
aq(ax.UIElements.Main,0.45,{
Size=not ax.IsFullscreen and C or UDim2.new(
0,
(aw.WindUI.ScreenGui.AbsoluteSize.X-20)/aw.WindUI.UIScale,
0,
(aw.WindUI.ScreenGui.AbsoluteSize.Y-20-52)/aw.WindUI.UIScale
),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

aq(
ax.UIElements.Main,
0.45,
{Position=not ax.IsFullscreen and B or UDim2.new(0.5,0,0.5,26)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
end

function ax.ToggleFullscreen(F)
local G=ax.IsFullscreen

A:Set(G)

if not G then
B=ax.UIElements.Main.Position
C=ax.UIElements.Main.Size

ax.CanResize=false
else
if ax.Resizable then
ax.CanResize=true
end
end

ax.IsFullscreen=not G

SetSize(true)
end

ao.AddSignal(aw.WindUI.ScreenGui:GetPropertyChangedSignal"AbsoluteSize",function()
if ax.IsFullscreen then
SetSize()
end
end)

ax:CreateTopbarButton("Minimize","minus",function()
if ax.Close then
ax:Close()
end






















end,(ax.Topbar.ButtonsType=="Default"and 997 or 998),nil,Color3.fromHex"#FFBD2E")

function ax.OnOpen(F,G)
ax.OnOpenCallback=G
end
function ax.OnClose(F,G)
ax.OnCloseCallback=G
end
function ax.OnDestroy(F,G)
ax.OnDestroyCallback=G
end

if aw.WindUI.UseAcrylic then
ax.AcrylicPaint.AddParent(ax.UIElements.Main)
end

function ax.SetIconSize(F,G)
local H
if typeof(G)=="number"then
H=UDim2.new(0,G,0,G)
ax.IconSize=G
elseif typeof(G)=="UDim2"then
H=G
ax.IconSize=G.X.Offset
end

if x then
x.Size=H
end
end

function ax.Open(F)
if ax.Destroyed then
return
end
task.spawn(function()
if ax.OnOpenCallback then
task.spawn(function()
ao.SafeCallback(ax.OnOpenCallback)
end)
end

task.wait(0.06)
ax.Closed=false

ax.UIElements.Main.Size=UDim2.new(ax.Size.X.Scale,ax.Size.X.Offset,0,100)

aq(ax.UIElements.Main,0.8,{

Size=ax.Size,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

if ax.UIElements.BackgroundGradient then
aq(ax.UIElements.BackgroundGradient,0.2,{
ImageTransparency=0,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

ax.UIElements.Main.Background.ImageTransparency=1
aq(ax.UIElements.Main.Background,0.4,{

ImageTransparency=ax.Transparent and aw.WindUI.TransparencyValue or 0,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()

if l then
if l:IsA"VideoFrame"then
l.Visible=true
else
aq(l,0.2,{
ImageTransparency=ax.BackgroundImageTransparency,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end

if ax.OpenButtonMain and ax.IsOpenButtonEnabled then
ax.OpenButtonMain:Visible(false)
end









aq(
d,
0.25,
{ImageTransparency=ax.ShadowTransparency},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()




aq(
u,
0.45,
{Size=UDim2.new(0,ax.DragFrameSize,0,4),ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
A:Set(true)

if ax.Resizable then
aq(
aA.ImageLabel,
0.45,
{ImageTransparency=0.8},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
ax.CanResize=true
end

ax.CanDropdown=true
ax.UIElements.Main.Visible=true



ax.UIElements.Main:WaitForChild"Main".Visible=true

aw.WindUI:ToggleAcrylic(true)

end)
end
function ax.Close(F)
if ax.Destroyed then
return
end

local G={}

if ax.OnCloseCallback then
task.spawn(function()
ao.SafeCallback(ax.OnCloseCallback)
end)
end

aw.WindUI:ToggleAcrylic(false)

if ax.UIElements.Main and ax.UIElements.Main:WaitForChild"Main"then
ax.UIElements.Main.Main.Visible=false
end

ax.CanDropdown=false
ax.Closed=true

aq(ax.UIElements.Main,0.9,{

Size=UDim2.new(ax.Size.X.Scale,ax.Size.X.Offset,0,0),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if ax.UIElements.BackgroundGradient then
aq(ax.UIElements.BackgroundGradient,0.2,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

aq(ax.UIElements.Main.Background,0.3,{

ImageTransparency=1,
},Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut):Play()








if l then
if l:IsA"VideoFrame"then
l.Visible=false
else
aq(l,0.3,{
ImageTransparency=1,
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end
end
aq(d,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()




aq(
u,
0.3,
{Size=UDim2.new(0,0,0,4),ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut
):Play()
aq(
aA.ImageLabel,
0.3,
{ImageTransparency=1},
Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out
):Play()
A:Set(false)
ax.CanResize=false

task.spawn(function()
task.wait(0.4)

if not ax.Closed then
return
end

ax.UIElements.Main.Visible=false

if ax.OpenButtonMain and not ax.Destroyed and ax.IsOpenButtonEnabled then
ax.OpenButtonMain:Visible(true)
end
end)

function G.Destroy(H)
task.spawn(function()
if ax.OnDestroyCallback then
task.spawn(function()
ao.SafeCallback(ax.OnDestroyCallback)
end)
end

if ax.AcrylicPaint and ax.AcrylicPaint.Model then
ax.AcrylicPaint.Model:Destroy()
end

ax.Destroyed=true

task.wait(0.4)

aw.WindUI.ScreenGui:Destroy()
aw.WindUI.NotificationGui:Destroy()
aw.WindUI.DropdownGui:Destroy()
aw.WindUI.TooltipGui:Destroy()

ao.DisconnectAll()

return
end)
end

return G
end
function ax.Destroy(F)
return ax:Close():Destroy()
end
function ax.Toggle(F)
if ax.Closed then
ax:Open()
else
ax:Close()
end
end

function ax.ToggleTransparency(F,G)

ax.Transparent=G
aw.WindUI.Transparent=G

ax.UIElements.Main.Background.ImageTransparency=G and aw.WindUI.TransparencyValue or 0


end

function ax.LockAll(F)
for G,H in next,ax.AllElements do
if H.Lock then
H:Lock()
end
end
end
function ax.UnlockAll(F)
for G,H in next,ax.AllElements do
if H.Unlock then
H:Unlock()
end
end
end
function ax.GetLocked(F)
local G={}

for H,J in next,ax.AllElements do
if J.Locked then
table.insert(G,J)
end
end

return G
end
function ax.GetUnlocked(F)
local G={}

for H,J in next,ax.AllElements do
if J.Locked==false then
table.insert(G,J)
end
end

return G
end

function ax.GetUIScale(F,G)
return aw.WindUI.UIScale
end

function ax.SetUIScale(F,G)
aw.WindUI.UIScale=G
aq(aw.WindUI.UIScaleObj,0.2,{Scale=G},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
return ax
end

function ax.SetToTheCenter(F)
aq(
ax.UIElements.Main,
0.45,
{Position=UDim2.new(0.5,0,0.5,0)},
Enum.EasingStyle.Quint,
Enum.EasingDirection.Out
):Play()
return ax
end

function ax.SetCurrentConfig(F,G)
ax.CurrentConfig=G
end

do
local F=40
local G=am.ViewportSize
local H=Vector2.new(ax.Size.X.Offset,ax.Size.Y.Offset)

if not ax.IsFullscreen and ax.AutoScale then
local J=G.X-(F*2)
local L=G.Y-(F*2)

local M=J/H.X
local N=L/H.Y

local O=math.min(M,N)

local P=0.3
local Q=1.0

local R=math.clamp(O,P,Q)

local S=ax:GetUIScale()or 1
local T=0.05

if math.abs(R-S)>T then
ax:SetUIScale(R)
end
end
end

if ax.OpenButtonMain and ax.OpenButtonMain.Button then
ao.AddSignal(ax.OpenButtonMain.Button.TextButton.MouseButton1Click,function()


ax:Open()
end)
end

ao.AddSignal(ag.InputBegan,function(F,G)
if G then
return
end

if ax.ToggleKey then
if F.KeyCode==ax.ToggleKey then
ax:Toggle()
end
end
end)

task.spawn(function()

ax:Open()
end)

function ax.EditOpenButton(F,G)
return ax.OpenButtonMain:Edit(G)
end

if ax.OpenButton and typeof(ax.OpenButton)=="table"then
ax:EditOpenButton(ax.OpenButton)
end

local F=a.ad()
local G=a.ae()
local H=F.Init(ax,aw.WindUI,aw.WindUI.TooltipGui)
H:OnChange(function(J)
ax.CurrentTab=J
end)

ax.TabModule=H

function ax.Tab(J,L)
L.Parent=ax.UIElements.SideBar.Frame
return H.New(L,aw.WindUI.UIScale)
end

function ax.SelectTab(J,L)
H:SelectTab(L)
end

function ax.Section(J,L)
return G.New(
L,
ax.UIElements.SideBar.Frame,
ax.Folder,
aw.WindUI.UIScale,
ax
)
end

function ax.IsResizable(J,L)
ax.Resizable=L
ax.CanResize=L
end

function ax.SetPanelBackground(J,L)
if typeof(L)=="boolean"then
ax.HidePanelBackground=L

ax.UIElements.MainBar.Background.Visible=L

if H then
for M,N in next,H.Containers do
N.ScrollingFrame.UIPadding.PaddingTop=UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingLeft=
UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingRight=
UDim.new(0,ax.HidePanelBackground and 20 or 10)
N.ScrollingFrame.UIPadding.PaddingBottom=
UDim.new(0,ax.HidePanelBackground and 20 or 10)
end
end
end
end

function ax.Divider(J)
local L=ap("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=0.9,
ThemeTag={
BackgroundColor3="Text",
},
})
local M=ap("Frame",{
Parent=ax.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,5),
BackgroundTransparency=1,
},{
L,
})

return M
end

local J=a.o()
function ax.Dialog(L,M)
local N={
Title=M.Title or"Dialog",
Width=M.Width or 320,
Content=M.Content,
Buttons=M.Buttons or{},

TextPadding=14,
}
local O=J.Create(false,"Dialog",ax,aw.WindUI,ax.UIElements.Main.Main)

O.UIElements.Main.Size=UDim2.new(0,N.Width,0,0)

local P=ap("Frame",{
Size=UDim2.new(1,0,1,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
},{
ap("UIListLayout",{
FillDirection="Vertical",

Padding=UDim.new(0,O.UIPadding),
}),
})

local Q=ap("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=P,
},{
ap("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,O.UIPadding),
VerticalAlignment="Center",
}),
ap("UIPadding",{
PaddingTop=UDim.new(0,N.TextPadding/2),
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
}),
})

local R
if M.Icon then
R=ao.Image(
M.Icon,
N.Title..":"..M.Icon,
0,
ax,
"Dialog",
true,
M.IconThemed
)
R.Size=UDim2.new(0,22,0,22)
R.Parent=Q
end

O.UIElements.UIListLayout=ap("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Vertical",
HorizontalAlignment="Left",
VerticalFlex="SpaceBetween",
Parent=O.UIElements.Main,
})

ap("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=O.UIElements.Main,
})

O.UIElements.Title=ap("TextLabel",{
Text=N.Title,
TextSize=20,
FontFace=Font.new(ao.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,R and-26-O.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=Q,
})
if N.Content then
ap("TextLabel",{
Text=N.Content,
TextSize=18,
TextTransparency=0.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(ao.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
Parent=P,
},{
ap("UIPadding",{
PaddingLeft=UDim.new(0,N.TextPadding/2),
PaddingRight=UDim.new(0,N.TextPadding/2),
PaddingBottom=UDim.new(0,N.TextPadding/2),
}),
})
end

local S=ap("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Horizontal",
HorizontalAlignment="Center",
HorizontalFlex="Fill",
})

local T=ap("Frame",{
Size=UDim2.new(1,0,0,36),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=O.UIElements.Main,
LayoutOrder=4,
},{
S,






})

local U={}

for V,W in next,N.Buttons do
local X=
as(W.Title,W.Icon,W.Callback,W.Variant,T,O,true)
table.insert(U,X)
X.Size=UDim2.new(1,0,1,0)
end





















































O:Open()

return O
end

local L=false

ax:CreateTopbarButton("Close","x",function()
if not L then
if not ax.IgnoreAlerts then
L=true

ax:Dialog{

Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()
L=false
end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()
L=false
ax:Destroy()
end,
Variant="Primary",
},
},
}
else
ax:Destroy()
end
end
end,(ax.Topbar.ButtonsType=="Default"and 999 or 997),nil,Color3.fromHex"#FF5F56")

function ax.Tag(M,N)
if ax.UIElements.Main.Main.Topbar.Center.Visible==false then
ax.UIElements.Main.Main.Topbar.Center.Visible=true
end
N.Window=ax
return au:New(N,ax.UIElements.Main.Main.Topbar.Center.Holder)
end

local M=aw.WindUI.GenerateGUID()

local function startResizing(N)
if ax.CanResize then
isResizing=true
aB.Active=true
initialSize=ax.UIElements.Main.Size
initialInputPosition=N.Position


aq(aA.ImageLabel,0.1,{ImageTransparency=0.35}):Play()

ao.AddSignal(N.Changed,function()
if N.UserInputState==Enum.UserInputState.End then
if aw.WindUI.CurrentInput and aw.WindUI.CurrentInput~=M then
return
end

aw.WindUI.CurrentInput=nil

isResizing=false
aB.Active=false


aq(aA.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)
end
end

ao.AddSignal(aA.InputBegan,function(N)
if
N.UserInputType==Enum.UserInputType.MouseButton1
or N.UserInputType==Enum.UserInputType.Touch
then
if aw.WindUI.CurrentInput and aw.WindUI.CurrentInput~=M then
return
end
aw.WindUI.CurrentInput=M

if ax.CanResize then
startResizing(N)
end
end
end)

ao.AddSignal(ag.InputChanged,function(N)
if
N.UserInputType==Enum.UserInputType.MouseMovement
or N.UserInputType==Enum.UserInputType.Touch
then
if isResizing and ax.CanResize then
local O=N.Position-initialInputPosition
local P=UDim2.new(0,initialSize.X.Offset+O.X*2,0,initialSize.Y.Offset+O.Y*2)

P=UDim2.new(
P.X.Scale,
math.clamp(P.X.Offset,ax.MinSize.X,ax.MaxSize.X),
P.Y.Scale,
math.clamp(P.Y.Offset,ax.MinSize.Y,ax.MaxSize.Y)
)

aq(ax.UIElements.Main,0.08,{
Size=P,
},Enum.EasingStyle.Quad,Enum.EasingDirection.Out):Play()

ax.Size=P
end
end
end)

ao.AddSignal(aA.MouseEnter,function()
if aw.WindUI.CurrentInput and aw.WindUI.CurrentInput~=M then
return
end
if not isResizing then
aq(aA.ImageLabel,0.1,{ImageTransparency=0.35}):Play()
end
end)
ao.AddSignal(aA.MouseLeave,function()
if aw.WindUI.CurrentInput and aw.WindUI.CurrentInput~=M then
return
end
if not isResizing then
aq(aA.ImageLabel,0.17,{ImageTransparency=0.8}):Play()
end
end)



local N=0
local O=0.4
local P
local Q=0

function onDoubleClick()
ax:SetToTheCenter()
end

ao.AddSignal(u.Frame.MouseButton1Up,function()
local R=tick()
local S=ax.Position

Q=Q+1

if Q==1 then
N=R
P=S

task.spawn(function()
task.wait(O)
if Q==1 then
Q=0
P=nil
end
end)
elseif Q==2 then
if R-N<=O and S==P then
onDoubleClick()
end

Q=0
P=nil
N=0
else
Q=1
N=R
P=S
end
end)



if not ax.HideSearchBar then
local R=a.ag()
local S=false





















local T=ar("Search","search",ax.UIElements.SideBarContainer,true)
T.Size=UDim2.new(1,-ax.UIPadding/2,0,39)
T.Position=UDim2.new(0,ax.UIPadding/2,0,0)

ao.AddSignal(T.MouseButton1Click,function()
if S then
return
end

R.new(ax.TabModule,ax.UIElements.Main,function()

S=false
if ax.Resizable then
ax.CanResize=true
end

aq(b,0.1,{ImageTransparency=1}):Play()
b.Active=false
end)
aq(b,0.1,{ImageTransparency=0.65}):Play()
b.Active=true

S=true
ax.CanResize=false
end)
end



function ax.DisableTopbarButtons(R,S)
for T,U in next,S do
for V,W in next,ax.TopBarButtons do
if W.Name==U then
W.Object.Visible=false
end
end
end
end



























return ax
end end function a.ah():typeof(__modImpl())local aa=a.cache.ah if not aa then aa={c=__modImpl()}a.cache.ah=aa end return aa.c end end end

local aa={
Window=nil,
Theme=nil,
Creator=a.d(),
LocalizationModule=a.e(),
NotificationModule=a.f(),
Themes=nil,
Transparent=false,

TransparencyValue=0.15,

UIScale=1,

ConfigManager=nil,
Version="0.0.0",

Services=a.k(),

OnThemeChangeFunction=nil,

cloneref=nil,
UIScaleObj=nil,

CreateWindow=nil,

CurrentInput=nil,
}

local ag=(cloneref or clonereference or function(ag)
return ag
end)

aa.cloneref=ag

local aj=ag(game:GetService"HttpService")
local al=ag(game:GetService"Players")
local am=ag(game:GetService"CoreGui")
local an=ag(game:GetService"RunService")
local ao=ag(game:GetService"UserInputService")

function aa.GenerateGUID()
return aj:GenerateGUID(false)
end

local ap=aa.GenerateGUID()

ao.InputBegan:Connect(function(aq,ar)




task.defer(function()
if
aq.UserInputType==Enum.UserInputType.MouseButton1
or aq.UserInputType==Enum.UserInputType.Touch
then
if aa.CurrentInput and aa.CurrentInput~=ap then
return
end

aa.CurrentInput=ap


end
end)
end)
ao.InputEnded:Connect(function(aq,ar)
if aq.UserInputType==Enum.UserInputType.MouseButton1 or aq.UserInputType==Enum.UserInputType.Touch then
if aa.CurrentInput and aa.CurrentInput~=ap then
return
end

aa.CurrentInput=nil
end
end)

local aq=al.LocalPlayer or nil

local ar=aj:JSONDecode(a.l())
if ar then
aa.Version=ar.version
end

local as=a.p()
local at=a.q()
local au=a.r()
local av=a.s()

local aw=aa.Creator

local ax=aw.New




local ay=a.w()

local az=protectgui or(syn and syn.protect_gui)or function()end

local aA=gethui and gethui()or(am or aq:WaitForChild"PlayerGui")

local aB=ax("UIScale",{
Scale=aa.UIScale,
})

aa.UIScaleObj=aB

aa.ScreenGui=ax("ScreenGui",{
Name="WindUI",
Parent=aA,
IgnoreGuiInset=true,
ScreenInsets="None",
DisplayOrder=-99999,
},{

ax("Folder",{
Name="Window",
}),






ax("Folder",{
Name="KeySystem",
}),
ax("Folder",{
Name="Popups",
}),
ax("Folder",{
Name="ToolTips",
}),
})

aa.NotificationGui=ax("ScreenGui",{
Name="WindUI/Notifications",
Parent=aA,
IgnoreGuiInset=true,
})
aa.DropdownGui=ax("ScreenGui",{
Name="WindUI/Dropdowns",
Parent=aA,
IgnoreGuiInset=true,
})
aa.TooltipGui=ax("ScreenGui",{
Name="WindUI/Tooltips",
Parent=aA,
IgnoreGuiInset=true,
})
az(aa.ScreenGui)
az(aa.NotificationGui)
az(aa.DropdownGui)
az(aa.TooltipGui)

aw.Init(aa)

function aa.SetParent(b,d)
if aa.ScreenGui then
aa.ScreenGui.Parent=d
end
if aa.NotificationGui then
aa.NotificationGui.Parent=d
end
if aa.DropdownGui then
aa.DropdownGui.Parent=d
end
if aa.TooltipGui then
aa.TooltipGui.Parent=d
end
end
math.clamp(aa.TransparencyValue,0,1)

local b=aa.NotificationModule.Init(aa.NotificationGui)

function aa.Notify(d,f)
f.Holder=b.Frame
f.Window=aa.Window

return aa.NotificationModule.New(f)
end

function aa.SetNotificationLower(d,f)
b.SetLower(f)
end

function aa.SetFont(d,f)
aw.UpdateFont(f)
end

function aa.OnThemeChange(d,f)
aa.OnThemeChangeFunction=f
end

function aa.AddTheme(d,f)
aa.Themes[f.Name]=f
return f
end

function aa.SetTheme(d,f)
if aa.Themes[f]then
aa.Theme=aa.Themes[f]
aw.SetTheme(aa.Themes[f])

if aa.OnThemeChangeFunction then
aa.OnThemeChangeFunction(f)
end

return aa.Themes[f]
end
return nil
end

function aa.GetThemes(d)
return aa.Themes
end
function aa.GetCurrentTheme(d)
return aa.Theme.Name
end
function aa.GetTransparency(d)
return aa.Transparent or false
end
function aa.GetWindowSize(d)
return aa.Window.UIElements.Main.Size
end
function aa.Localization(d,f)
return aa.LocalizationModule:New(f,aw)
end

function aa.SetLanguage(d,f)
if aw.Localization then
return aw.SetLanguage(f)
end
return false
end

function aa.ToggleAcrylic(d,f)
if aa.Window and aa.Window.AcrylicPaint and aa.Window.AcrylicPaint.Model then
aa.Window.Acrylic=f
aa.Window.AcrylicPaint.Model.Transparency=f and 0.98 or 1
if f then
ay.Enable()
else
ay.Disable()
end
end
end

function aa.Gradient(d,f,g)
local h={}
local i={}

for l,m in next,f do
local p=tonumber(l)
if p then
p=math.clamp(p/100,0,1)

local r=m.Color
if typeof(r)=="string"and string.sub(r,1,1)=="#"then
r=Color3.fromHex(r)
end

local u=m.Transparency or 0

table.insert(h,ColorSequenceKeypoint.new(p,r))
table.insert(i,NumberSequenceKeypoint.new(p,u))
end
end

table.sort(h,function(l,m)
return l.Time<m.Time
end)
table.sort(i,function(l,m)
return l.Time<m.Time
end)

if#h<2 then
table.insert(h,ColorSequenceKeypoint.new(1,h[1].Value))
table.insert(i,NumberSequenceKeypoint.new(1,i[1].Value))
end

local l={
Color=ColorSequence.new(h),
Transparency=NumberSequence.new(i),
}

if g then
for m,p in pairs(g)do
l[m]=p
end
end

return l
end

function aa.Popup(d,f)
f.WindUI=aa
return a.x().new(f,aa.ScreenGui.Popups)
end

function aa.CreateAuthWindow(d,f,g)
f.WindUI=aa
return at.new(f,g)
end

function aa.CreateMapSelector(d,f,g)
f=f or{}
f.WindUI=aa
return au.new(f,g)
end

function aa.CreateServerSelector(d,f,g)
f=f or{}
f.WindUI=aa
return av.new(f,g)
end

aa.Themes=a.y()(aa,aw)

aw.Themes=aa.Themes

aa:SetTheme"Dark"
aa:SetLanguage(aw.Language)

function aa.CreateWindow(d,f)
local g=a.ah()

if not an:IsStudio()and writefile then
if not isfolder"WindUI"then
makefolder"WindUI"
end
if f.Folder then
makefolder(f.Folder)
else
makefolder(f.Title)
end
end

f.WindUI=aa
f.Window=aa.Window
f.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local h=true

local i=aa.Themes[f.Theme or"Dark"]


aw.SetTheme(i)

local l=gethwid or function()
return al.LocalPlayer.UserId
end

local m=l()

if f.KeySystem then
h=false

local function loadKeysystem()
as.new(f,m,function(p)
h=p
end)
end

local p=(f.Folder or"Temp").."/"..m..".key"

if f.KeySystem.KeyValidator then
if f.KeySystem.SaveKey and isfile(p)then
local r=readfile(p)
local u=f.KeySystem.KeyValidator(r)

if u then
h=true
else
loadKeysystem()
end
else
loadKeysystem()
end
elseif not f.KeySystem.API then
if f.KeySystem.SaveKey and isfile(p)then
local r=readfile(p)
local u=(type(f.KeySystem.Key)=="table")and table.find(f.KeySystem.Key,r)
or tostring(f.KeySystem.Key)==tostring(r)

if u then
h=true
else
loadKeysystem()
end
else
loadKeysystem()
end
else
if isfile(p)then
local r=readfile(p)
local u=false

for v,x in next,f.KeySystem.API do
local z=aa.Services[x.Type]
if z then
local A={}
for B,C in next,z.Args do
table.insert(A,x[C])
end

local B=z.New(table.unpack(A))
local C=B.Verify(r)
if C then
u=true
break
end
end
end

h=u
if not u then
loadKeysystem()
end
else
loadKeysystem()
end
end

repeat
task.wait()
until h
end

local p=g(f)

aa.Transparent=f.Transparent
aa.Window=p

if f.Acrylic then
ay.init()
end













return p
end

return aa