local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,al,b,c,d,e,f,g,h,i,j={function()local b,c,d=a(1)local e return(function(...)
local f,g,h,i,j=d(c.Bundles.themeSystem),d(c.Bundles.data),d(c.utilities.references),d(c.utilities.connections),d(c.
utilities.get)local function k(l,m,n)n.Parent=m return d(c.components['new'..l])(n)end local l={}function l.Window(m,n)
assert(n.Title,':Window needs a Title')n.Parent=n.Parent or game.CoreGui n.KeyCode=n.KeyCode or nil n.isMobile=n.
isMobile or false f.create(n.CustomTheme or{})if n.Size then n.Size.X=n.Size.X or 550 n.Size.Y=n.Size.Y or 400 math.
clamp(n.Size.X,550,9e9)math.clamp(n.Size.Y,400,9e9)elseif not n.Size then n.Size={X=550,Y=400}end if n.Parent:
FindFirstChild(n.Title)then n.Parent:FindFirstChild(n.Title):Destroy()end local o,p,q=d(c.platforms.mobile),d(c.
platforms.computer),g.add({boolean=true},'isToggled')g.add({EnumItem=n.KeyCode},'keyCode')g.add({data={}},'selectedTab')
g.add({boolean=false},'selectedFirst')local r=g.add{data=n}n.uid=r.uid local s,t,u,v=n.isMobile and o(n)or p(n),h.get
'windowsList',h.get'sideBar',h.get'notificationList'l.Windows={}function l.Windows.Tab(w,x)local y=g.add{data=x}x.uid=y.
uid x.tabPage=k('Window',t,x)local z=x.tabPage x.tabButton=k('Tab',u,{tab_data=y})y:update('data',x)l.Windows.Component=
{}function l.Windows.Component.Button(A,B)B.tabColor=x.tabColor return k('Button',z,B)end function l.Windows.Component.
Toggle(A,B)B.tabColor=x.tabColor return k('Toggle',z,B)end function l.Windows.Component.TextBox(A,B)B.tabColor=x.
tabColor return k('TextBox',z,B)end function l.Windows.Component.Keybind(A,B)B.tabColor=x.tabColor return k('Keybind',z,
B)end function l.Windows.Component.Dropdown(A,B)B.tabColor=x.tabColor return k('Dropdown',z,B)end function l.Windows.
Component.Slider(A,B)B.tabColor=x.tabColor return k('Slider',z,B)end function l.Windows.Component.Section(A,B:string)
return k('Section',z,{Text=B})end function l.Windows.Component.Paragraph(A,B)B.tabColor=x.tabColor return k('Paragraph',
z,B)end function l.Windows.Component.Label(A,B:string)local C={Text=B,tabColor=x.tabColor}return k('Label',z,C)end
function l.Windows.Component.Group(A,B)B.tabColor=x.tabColor local C,D=k('Group',z,B)function D.Button(E,F)F.tabColor=x.
tabColor return k('Button',C,F)end function D.Toggle(E,F)F.tabColor=x.tabColor return k('Toggle',C,F)end function D.
TextBox(E,F)F.tabColor=x.tabColor return k('TextBox',C,F)end function D.Keybind(E,F)F.tabColor=x.tabColor return k(
'Keybind',C,F)end function D.Dropdown(E,F)F.tabColor=x.tabColor return k('Dropdown',C,F)end function D.Slider(E,F)F.
tabColor=x.tabColor return k('Slider',C,F)end function D.Section(E,F:string)return k('Section',C,{Text=F})end function D
.Paragraph(E,F)F.tabColor=x.tabColor return k('Paragraph',C,F)end function D.Label(E,F:string)local G={Text=F,tabColor=x
.tabColor}return k('Label',C,G)end function D.ColorPicker(E,F)F.tabColor=x.tabColor return k('ColorPicker',C,F)end
return D end function l.Windows.Component.ColorPicker(A,B)B.tabColor=x.tabColor return k('ColorPicker',z,B)end return l.
Windows.Component end function l.SetCustomTheme(w,x)f.create(x)end function l.Destroy(w)i.deleteConnections()h.clear()s:
Destroy()end function l.ToggleQuake(w)q:update('boolean',not j(q.boolean))end function l.Windows.Notify(w,x)return k(
'Notification',v,x)end return l.Windows end return l end)()end,[3]=function()local b,c,d=a(3)local e return(function(...
)local f,g=d(c.PubTypes),d(c.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>export type
CanBeState<T> =PubTypes.CanBeState<T>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value<T>export
type Computed<T> =PubTypes.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys<KI,KO> =
PubTypes.ForKeys<KI,KO>export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.Observer
export type Tween<T> =PubTypes.Tween<T>export type Spring<T> =PubTypes.Spring<T>type Fusion={version:PubTypes.Version,
New:(className:string)->((propertyTable:PubTypes.PropertyTable)->Instance),Hydrate:(target:Instance)->((propertyTable:
PubTypes.PropertyTable)->Instance),Ref:PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey,Children:PubTypes.SpecialKey,Out:
PubTypes.SpecialKey,OnEvent:(eventName:string)->PubTypes.SpecialKey,OnChange:(propertyName:string)->PubTypes.SpecialKey,
Value:<T>(initialValue:T)->Value<T>,Computed:<T>(callback:()->T,destructor:((T)->())?)->Computed<T>,ForPairs:<KI,VI,KO,
VO,M>(inputTable:CanBeState<{[KI]:VI}>,processor:(KI,VI)->(KO,VO,M?),destructor:((KO,VO,M?)->())?)->ForPairs<KO,VO>,
ForKeys:<KI,KO,M>(inputTable:CanBeState<{[KI]:any}>,processor:(KI)->(KO,M?),destructor:((KO,M?)->())?)->ForKeys<KO,any>,
ForValues:<VI,VO,M>(inputTable:CanBeState<{[any]:VI}>,processor:(VI)->(VO,M?),destructor:((VO,M?)->())?)->ForValues<any,
VO>,Observer:(watchedState:StateObject<any>)->Observer,Tween:<T>(goalState:StateObject<T>,tweenInfo:TweenInfo?)->Tween<T
>,Spring:<T>(goalState:StateObject<T>,speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->(),doNothing:(...any
)->()}return g('Fusion',{version={major=0,minor=2,isRelease=true},New=d(c.Instances.New),Hydrate=d(c.Instances.Hydrate),
Ref=d(c.Instances.Ref),Out=d(c.Instances.Out),Cleanup=d(c.Instances.Cleanup),Children=d(c.Instances.Children),OnEvent=d(
c.Instances.OnEvent),OnChange=d(c.Instances.OnChange),Value=d(c.State.Value),Computed=d(c.State.Computed),ForPairs=d(c.
State.ForPairs),ForKeys=d(c.State.ForKeys),ForValues=d(c.State.ForValues),Observer=d(c.State.Observer),Tween=d(c.
Animation.Tween),Spring=d(c.Animation.Spring),cleanup=d(c.Utility.cleanup),doNothing=d(c.Utility.doNothing)})::Fusion
end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,q,
r=d(f.PubTypes),d(f.Types),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Animation.unpackType),d(f.Animation.
SpringScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Dependencies.updateAll),d(f.
Utility.xtypeof),d(f.State.unwrap),{}local s,t={__index=r},{__mode='k'}function r.get(u,v:boolean?):any if v~=false then
m(u)end return u._currentValue end function r.setPosition(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType
then i('springTypeMismatch',nil,w,u._currentType)end u._springPositions=k(v,w)u._currentValue=v l.add(u)o(u)end function
r.setVelocity(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u.
_currentType)end u._springVelocities=k(v,w)l.add(u)end function r.addVelocity(u,v:PubTypes.Animatable)local w=typeof(v)
if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end local x=k(v,w)for y,z in ipairs(x)do u.
_springVelocities[y]+=z end l.add(u)end function r.update(u):boolean local v=u._goalState:get(false)if v==u._goalValue
then local w=q(u._damping)if typeof(w)~='number'then j('mistypedSpringDamping',nil,typeof(w))elseif w<0 then j(
'invalidSpringDamping',nil,w)else u._currentDamping=w end local x=q(u._speed)if typeof(x)~='number'then j(
'mistypedSpringSpeed',nil,typeof(x))elseif x<0 then j('invalidSpringSpeed',nil,x)else u._currentSpeed=x end return false
else u._goalValue=v local w,x=u._currentType,typeof(v)u._currentType=x local y=k(v,x)local z=#y u._springGoals=y if x~=w
then u._currentValue=u._goalValue local A,B=table.create(z,0),table.create(z,0)for C,D in ipairs(y)do A[C]=D end u.
_springPositions=A u._springVelocities=B l.remove(u)return true elseif z==0 then u._currentValue=u._goalValue return
true else l.add(u)return false end end end local function u<T>(v:PubTypes.Value<T>,w:PubTypes.CanBeState<number>?,x:
PubTypes.CanBeState<number>?):Types.Spring<T>if w==nil then w=10 end if x==nil then x=1 end local y={[v]=true}if p(w)==
'State'then y[w]=true end if p(x)=='State'then y[x]=true end local z=setmetatable({type='State',kind='Spring',
dependencySet=y,dependentSet=setmetatable({},t),_speed=w,_damping=x,_goalState=v,_goalValue=nil,_currentType=nil,
_currentValue=nil,_currentSpeed=q(w),_currentDamping=q(x),_springPositions=nil,_springGoals=nil,_springVelocities=nil},s
)n(z)v.dependentSet[z]=true z:update()return z end return u end)()end,[6]=function()local b,c,d=a(6)local e return(
function(...)local f,g=game:GetService'RunService',c.Parent.Parent local h,i,j,k=d(g.Types),d(g.Animation.packType),d(g.
Animation.springCoefficients),d(g.Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types.Spring<any>local l,m,n:
Set<Spring>,o={},0.0001,{},os.clock()function l.add(p:Spring)p._lastSchedule=o p._startDisplacements={}p.
_startVelocities={}for q,r in ipairs(p._springGoals)do p._startDisplacements[q]=p._springPositions[q]-r p.
_startVelocities[q]=p._springVelocities[q]end n[p]=true end function l.remove(p:Spring)n[p]=nil end local function p()
local q:Set<Spring> ={}o=os.clock()for r in pairs(n)do local s,t,u,v=j(o-r._lastSchedule,r._currentDamping,r.
_currentSpeed)local w,x,y,z,A=r._springPositions,r._springVelocities,r._startDisplacements,r._startVelocities,false for
B,C in ipairs(r._springGoals)do local D,E=y[B],z[B]local F,G=D*s+E*t,D*u+E*v if math.abs(F)>m or math.abs(G)>m then A=
true end w[B]=F+C x[B]=G end if not A then q[r]=true end end for s in pairs(n)do s._currentValue=i(s._springPositions,s.
_currentType)k(s)end for t in pairs(q)do n[t]=nil end end f:BindToRenderStep('__FusionSpringScheduler',Enum.
RenderPriority.First.Value,p)return l end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)local f=c.
Parent.Parent local g,h,i,j,k,l,m,n,o=d(f.PubTypes),d(f.Types),d(f.Animation.TweenScheduler),d(f.Dependencies.
useDependency),d(f.Dependencies.initDependency),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Utility.xtypeof)
,{}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false then j(t)end return t._currentValue
end function o.update(t):boolean local u=t._goalState:get(false)if u==t._nextValue and not t._currentlyAnimating then
return false end local v=t._tweenInfo if t._tweenInfoIsState then v=v:get()end if typeof(v)~='TweenInfo'then m(
'mistypedTweenInfo',nil,typeof(v))return false end t._prevValue=t._currentValue t._nextValue=u t._currentTweenStartTime=
os.clock()t._currentTweenInfo=v local w=v.DelayTime+v.Time if v.Reverses then w+=v.Time end w*=v.RepeatCount+1 t.
_currentTweenDuration=w i.add(t)return false end local function t<T>(u:PubTypes.StateObject<PubTypes.Animatable>,v:
PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local w=u:get(false)if v==nil then v=TweenInfo.new()end local x,y={[u]=
true},n(v)=='State'if y then x[v]=true end local z=v if y then z=z:get()end if typeof(z)~='TweenInfo'then l(
'mistypedTweenInfo',nil,typeof(z))end local A=setmetatable({type='State',kind='Tween',dependencySet=x,dependentSet=
setmetatable({},q),_goalState=u,_tweenInfo=v,_tweenInfoIsState=y,_prevValue=w,_nextValue=w,_currentValue=w,
_currentTweenInfo=v,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},p)k(A)u.dependentSet[A]=
true return A end return t end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f,g=game:GetService
'RunService',c.Parent.Parent local h,i,j,k,l=d(g.Types),d(g.Animation.lerpType),d(g.Animation.getTweenRatio),d(g.
Dependencies.updateAll),{}type Set<T> ={[T]:any}type Tween=Types.Tween<any>local m,n:Set<Tween> ={__mode='k'},{}
setmetatable(n,m)function l.add(o:Tween)n[o]=true end function l.remove(o:Tween)n[o]=nil end local function o()local p=
os.clock()for q:Tween in pairs(n::any)do local t=p-q._currentTweenStartTime if t>q._currentTweenDuration then if q.
_currentTweenInfo.Reverses then q._currentValue=q._prevValue else q._currentValue=q._nextValue end q._currentlyAnimating
=false k(q)l.remove(q)else local u=j(q._currentTweenInfo,t)local v=i(q._prevValue,q._nextValue,u)q._currentValue=v q.
_currentlyAnimating=true k(q)end end end f:BindToRenderStep('__FusionTweenScheduler',Enum.RenderPriority.First.Value,o)
return l end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f=game:GetService'TweenService'
local function g(h:TweenInfo,i:number):number local j,k,l,m,n,o=h.DelayTime,h.Time,h.Reverses,1+h.RepeatCount,h.
EasingStyle,h.EasingDirection local p=j+k if l then p+=k end if i>=p*m then return 1 end local q=i%p if q<=j then return
0 end local t=(q-j)/k if t>1 then t=2-t end local u=f:GetValue(t,n,o)return u end return g end)()end,[10]=function()
local b,c,d=a(10)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.Oklab)
local function i(j:any,k:any,l:number):any local m=typeof(j)if typeof(k)==m then if m=='number'then local n,o=k::number,
j::number return(n-o)*l+o elseif m=='CFrame'then local n,o=k::CFrame,j::CFrame return o:Lerp(n,l)elseif m=='Color3'then
local n,o=k::Color3,j::Color3 local p,q=h.to(o),h.to(n)return h.from(p:Lerp(q,l),false)elseif m=='ColorSequenceKeypoint'
then local n,o=k::ColorSequenceKeypoint,j::ColorSequenceKeypoint local p,q=h.to(o.Value),h.to(n.Value)return
ColorSequenceKeypoint.new((n.Time-o.Time)*l+o.Time,h.from(p:Lerp(q,l),false))elseif m=='DateTime'then local n,o=k::
DateTime,j::DateTime return DateTime.fromUnixTimestampMillis((n.UnixTimestampMillis-o.UnixTimestampMillis)*l+o.
UnixTimestampMillis)elseif m=='NumberRange'then local n,o=k::NumberRange,j::NumberRange return NumberRange.new((n.Min-o.
Min)*l+o.Min,(n.Max-o.Max)*l+o.Max)elseif m=='NumberSequenceKeypoint'then local n,o=k::NumberSequenceKeypoint,j::
NumberSequenceKeypoint return NumberSequenceKeypoint.new((n.Time-o.Time)*l+o.Time,(n.Value-o.Value)*l+o.Value,(n.
Envelope-o.Envelope)*l+o.Envelope)elseif m=='PhysicalProperties'then local n,o=k::PhysicalProperties,j::
PhysicalProperties return PhysicalProperties.new((n.Density-o.Density)*l+o.Density,(n.Friction-o.Friction)*l+o.Friction,
(n.Elasticity-o.Elasticity)*l+o.Elasticity,(n.FrictionWeight-o.FrictionWeight)*l+o.FrictionWeight,(n.ElasticityWeight-o.
ElasticityWeight)*l+o.ElasticityWeight)elseif m=='Ray'then local n,o=k::Ray,j::Ray return Ray.new(o.Origin:Lerp(n.Origin
,l),o.Direction:Lerp(n.Direction,l))elseif m=='Rect'then local n,o=k::Rect,j::Rect return Rect.new(o.Min:Lerp(n.Min,l),o
.Max:Lerp(n.Max,l))elseif m=='Region3'then local n,o=k::Region3,j::Region3 local p,q=o.CFrame.Position:Lerp(n.CFrame.
Position,l),o.Size:Lerp(n.Size,l)/2 return Region3.new(p-q,p+q)elseif m=='Region3int16'then local n,o=k::Region3int16,j
::Region3int16 return Region3int16.new(Vector3int16.new((n.Min.X-o.Min.X)*l+o.Min.X,(n.Min.Y-o.Min.Y)*l+o.Min.Y,(n.Min.Z
-o.Min.Z)*l+o.Min.Z),Vector3int16.new((n.Max.X-o.Max.X)*l+o.Max.X,(n.Max.Y-o.Max.Y)*l+o.Max.Y,(n.Max.Z-o.Max.Z)*l+o.Max.
Z))elseif m=='UDim'then local n,o=k::UDim,j::UDim return UDim.new((n.Scale-o.Scale)*l+o.Scale,(n.Offset-o.Offset)*l+o.
Offset)elseif m=='UDim2'then local n,o=k::UDim2,j::UDim2 return o:Lerp(n,l)elseif m=='Vector2'then local n,o=k::Vector2,
j::Vector2 return o:Lerp(n,l)elseif m=='Vector2int16'then local n,o=k::Vector2int16,j::Vector2int16 return Vector2int16.
new((n.X-o.X)*l+o.X,(n.Y-o.Y)*l+o.Y)elseif m=='Vector3'then local n,o=k::Vector3,j::Vector3 return o:Lerp(n,l)elseif m==
'Vector3int16'then local n,o=k::Vector3int16,j::Vector3int16 return Vector3int16.new((n.X-o.X)*l+o.X,(n.Y-o.Y)*l+o.Y,(n.
Z-o.Z)*l+o.Z)end end if l<0.5 then return j else return k end end return i end)()end,[11]=function()local b,c,d=a(11)
local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.Oklab)local function i(j:{number}
,k:string):PubTypes.Animatable?if k=='number'then return j[1]elseif k=='CFrame'then return CFrame.new(j[1],j[2],j[3])*
CFrame.fromAxisAngle(Vector3.new(j[4],j[5],j[6]).Unit,j[7])elseif k=='Color3'then return h.from(Vector3.new(j[1],j[2],j[
3]),false)elseif k=='ColorSequenceKeypoint'then return ColorSequenceKeypoint.new(j[4],h.from(Vector3.new(j[1],j[2],j[3])
,false))elseif k=='DateTime'then return DateTime.fromUnixTimestampMillis(j[1])elseif k=='NumberRange'then return
NumberRange.new(j[1],j[2])elseif k=='NumberSequenceKeypoint'then return NumberSequenceKeypoint.new(j[2],j[1],j[3])elseif
k=='PhysicalProperties'then return PhysicalProperties.new(j[1],j[2],j[3],j[4],j[5])elseif k=='Ray'then return Ray.new(
Vector3.new(j[1],j[2],j[3]),Vector3.new(j[4],j[5],j[6]))elseif k=='Rect'then return Rect.new(j[1],j[2],j[3],j[4])elseif
k=='Region3'then local l,m=Vector3.new(j[1],j[2],j[3]),Vector3.new(j[4]/2,j[5]/2,j[6]/2)return Region3.new(l-m,l+m)
elseif k=='Region3int16'then return Region3int16.new(Vector3int16.new(j[1],j[2],j[3]),Vector3int16.new(j[4],j[5],j[6]))
elseif k=='UDim'then return UDim.new(j[1],j[2])elseif k=='UDim2'then return UDim2.new(j[1],j[2],j[3],j[4])elseif k==
'Vector2'then return Vector2.new(j[1],j[2])elseif k=='Vector2int16'then return Vector2int16.new(j[1],j[2])elseif k==
'Vector3'then return Vector3.new(j[1],j[2],j[3])elseif k=='Vector3int16'then return Vector3int16.new(j[1],j[2],j[3])else
return nil end end return i end)()end,[12]=function()local b,c,d=a(12)local e return(function(...)local function f(g:
number,h:number,i:number):(number,number,number,number)if g==0 or i==0 then return 1,0,0,1 end local j,k,l,m if h>1 then
local n,o=g*i,math.sqrt(h^2-1)local p,q=-0.5/o,-o-h local t,u=1/q,math.exp(n*q)local v=math.exp(n*t)j=(v*q-u*t)*p k=(u-v
)*p/i l=(v-u)*p*i m=(u*q-v*t)*p elseif h==1 then local n=g*i local o=math.exp(-n)j=o*(1+n)k=o*g l=o*(-n*i)m=o*(1-n)else
local n,o=g*i,math.sqrt(1-h^2)local p,q,t=1/o,o*n,math.exp(-n*h)local u,v=t*math.sin(q),t*math.cos(q)local w=u*p local x
=w*h j=x+v k=w l=-(x*h+u*o)m=v-x end return j,k,l,m end return f end)()end,[13]=function()local b,c,d=a(13)local e
return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Colour.Oklab)local function i(j:any,k:string):{
number}if k=='number'then local l=j::number return{l}elseif k=='CFrame'then local l,m=j:ToAxisAngle()return{j.X,j.Y,j.Z,
l.X,l.Y,l.Z,m}elseif k=='Color3'then local l=h.to(j)return{l.X,l.Y,l.Z}elseif k=='ColorSequenceKeypoint'then local l=h.
to(j.Value)return{l.X,l.Y,l.Z,j.Time}elseif k=='DateTime'then return{j.UnixTimestampMillis}elseif k=='NumberRange'then
return{j.Min,j.Max}elseif k=='NumberSequenceKeypoint'then return{j.Value,j.Time,j.Envelope}elseif k==
'PhysicalProperties'then return{j.Density,j.Friction,j.Elasticity,j.FrictionWeight,j.ElasticityWeight}elseif k=='Ray'
then return{j.Origin.X,j.Origin.Y,j.Origin.Z,j.Direction.X,j.Direction.Y,j.Direction.Z}elseif k=='Rect'then return{j.Min
.X,j.Min.Y,j.Max.X,j.Max.Y}elseif k=='Region3'then return{j.CFrame.X,j.CFrame.Y,j.CFrame.Z,j.Size.X,j.Size.Y,j.Size.Z}
elseif k=='Region3int16'then return{j.Min.X,j.Min.Y,j.Min.Z,j.Max.X,j.Max.Y,j.Max.Z}elseif k=='UDim'then return{j.Scale,
j.Offset}elseif k=='UDim2'then return{j.X.Scale,j.X.Offset,j.Y.Scale,j.Y.Offset}elseif k=='Vector2'then return{j.X,j.Y}
elseif k=='Vector2int16'then return{j.X,j.Y}elseif k=='Vector3'then return{j.X,j.Y,j.Z}elseif k=='Vector3int16'then
return{j.X,j.Y,j.Z}else return{}end end return i end)()end,[15]=function()local b,c,d=a(15)local e return(function(...)
local f={}function f.to(g:Color3):Vector3 local h,i,j=g.R*0.4122214708+g.G*0.5363325363+g.B*0.0514459929,g.R*
0.2119034982+g.G*0.6806995451+g.B*0.1073969566,g.R*0.0883024619+g.G*0.2817188376+g.B*0.6299787005 local k,l,m=h^(
0.3333333333333333),i^(0.3333333333333333),j^(0.3333333333333333)return Vector3.new(k*0.2104542553+l*0.793617785-m*
0.0040720468,k*1.9779984951-l*2.428592205+m*0.4505937099,k*0.0259040371+l*0.7827717662-m*0.808675766)end function f.from
(g:Vector3,h:boolean?):Color3 local i,j,k=g.X+g.Y*0.3963377774+g.Z*0.2158037573,g.X-g.Y*0.1055613458-g.Z*0.0638541728,g.
X-g.Y*0.0894841775-g.Z*1.291485548 local l,m,n=i^3,j^3,k^3 local o,p,q=l*4.0767416621-m*3.3077115913+n*0.2309699292,l*-
1.2684380046+m*2.6097574011-n*0.3413193965,l*-4.196086299999999E-3-m*0.7034186147+n*1.707614701 if not h then o=math.
clamp(o,0,1)p=math.clamp(p,0,1)q=math.clamp(q,0,1)end return Color3.new(o,p,q)end return f end)()end,[17]=function()
local b,c,d=a(17)local e return(function(...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),d(f.Logging.parseError),
d(f.Dependencies.sharedState)type Set<T> ={[T]:any}local j,k=i.initialisedStack,0 local function l(m:Set<PubTypes.
Dependency>,n:(...any)->any,...):(boolean,any)local o=i.dependencySet i.dependencySet=m i.initialisedStackSize+=1 local
p,q=(i.initialisedStackSize)if p>k then q={}j[p]=q k=p else q=j[p]table.clear(q)end local t=table.pack(xpcall(n,h,...))i
.dependencySet=o i.initialisedStackSize-=1 return table.unpack(t,1,t.n)end return l end)()end,[18]=function()local b,c,d
=a(18)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Dependencies.sharedState)local i=h
.initialisedStack local function j(k:PubTypes.Dependency)local l=h.initialisedStackSize for m,n in ipairs(i)do if m>l
then return end n[k]=true end end return j end)()end,[19]=function()local b,c,d=a(19)local e return(function(...)local f
=c.Parent.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}local h:{Set<PubTypes.Dependency>},i,j:Set<PubTypes.
Dependency>?={},0 return{dependencySet=j,initialisedStack=h,initialisedStackSize=i}end)()end,[20]=function()local b,c,d=
a(20)local e return(function(...)local f=c.Parent.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}type Descendant=(
PubTypes.Dependent&PubTypes.Dependency)|PubTypes.Dependent local function h(i:PubTypes.Dependency)local j:{[Descendant]:
number},k:{[Descendant]:boolean},l:{Descendant},m,n={},{},{},0,1 for o in i.dependentSet do m+=1 l[m]=o k[o]=true end
while n<=m do local p=l[n]local q=j[p]j[p]=if q==nil then 1 else q+1 if(p::any).dependentSet~=nil then for t in(p::any).
dependentSet do m+=1 l[m]=t end end n+=1 end n=1 while n<=m do local p=l[n]local q=j[p]-1 j[p]=q if q==0 and k[p]and p:
update()and(p::any).dependentSet~=nil then for t in(p::any).dependentSet do k[t]=true end end n+=1 end end return h end
)()end,[21]=function()local b,c,d=a(21)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.
Dependencies.sharedState)local i=h.initialisedStack local function j(k:PubTypes.Dependency)local l=h.dependencySet if l
~=nil then local m=h.initialisedStackSize if m>0 then local n=i[m]if n[k]~=nil then return end end l[k]=true end end
return j end)()end,[23]=function()local b,c,d=a(23)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f
.PubTypes),d(f.Logging.logWarn),d(f.State.Observer),d(f.Utility.xtypeof)type Set<T> ={[T]:boolean}local k,l=false,{}l.
type='SpecialKey'l.kind='Children'l.stage='descendants'function l.apply(m,n:any,o:Instance,p:{PubTypes.Task})local q:Set
<Instance>,t:Set<Instance>,u:{[PubTypes.StateObject<any>]:()->()},v:{[PubTypes.StateObject<any>]:()->()},w,x:()->()={},{
},{},{},false local function y()if not w then return end w=false t,q=q,t v,u=u,v table.clear(q)table.clear(u)
local function z(A:any,B:string?)local C=j(A)if C=='Instance'then q[A]=true if t[A]==nil then A.Parent=o else t[A]=nil
end if k and B~=nil then A.Name=B end elseif C=='State'then local D=A:get(false)if D~=nil then z(D,B)end local E=v[A]if
E==nil then E=i(A):onChange(x)else v[A]=nil end u[A]=E elseif C=='table'then for D,E in pairs(A)do local F,G:string?=(
typeof(D))if F=='string'then G=D elseif F=='number'and B~=nil then G=B..'_'..D end z(E,G)end else h(
'unrecognisedChildType',C)end end if n~=nil then z(n)end for A in pairs(t)do A.Parent=nil end for B,C in pairs(v)do C()
end end x=function()if not w then w=true task.defer(y)end end table.insert(p,function()n=nil w=true y()end)w=true y()end
return l::PubTypes.SpecialKey end)()end,[24]=function()local b,c,d=a(24)local e return(function(...)local f=c.Parent.
Parent local g,h=d(f.PubTypes),{}h.type='SpecialKey'h.kind='Cleanup'h.stage='observer'function h.apply(i,j:any,k:
Instance,l:{PubTypes.Task})table.insert(l,j)end return h end)()end,[25]=function()local b,c,d=a(25)local e return(
function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Instances.applyInstanceProps)local function i(j:
Instance)return function(k:PubTypes.PropertyTable):Instance h(k,j)return j end end return i end)()end,[26]=function()
local b,c,d=a(26)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f.PubTypes),d(f.Instances.
defaultProps),d(f.Instances.applyInstanceProps),d(f.Logging.logError)local function k(l:string)return function(m:
PubTypes.PropertyTable):Instance local n,o=pcall(Instance.new,l)if not n then j('cannotCreateClass',nil,l)end local p=h[
l]if p~=nil then for q,t in pairs(p)do o[q]=t end end i(m,o)return o end end return k end)()end,[27]=function()local b,c
,d=a(27)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Logging.logError)local function
i(j:string):PubTypes.SpecialKey local k={}k.type='SpecialKey'k.kind='OnChange'k.stage='observer'function k.apply(l,m:any
,n:Instance,o:{PubTypes.Task})local p,q=pcall(n.GetPropertyChangedSignal,n,j)if not p then h('cannotConnectChange',nil,n
.ClassName,j)elseif typeof(m)~='function'then h('invalidChangeHandler',nil,j)else table.insert(o,q:Connect(function()m((
n::any)[j])end))end end return k end return i end)()end,[28]=function()local b,c,d=a(28)local e return(function(...)
local f=c.Parent.Parent local g,h=d(f.PubTypes),d(f.Logging.logError)local function i(j:Instance,k:string)return(j::any)
[k]end local function j(k:string):PubTypes.SpecialKey local l={}l.type='SpecialKey'l.kind='OnEvent'l.stage='observer'
function l.apply(m,n:any,o:Instance,p:{PubTypes.Task})local q,t=pcall(i,o,k)if not q or typeof(t)~='RBXScriptSignal'then
h('cannotConnectEvent',nil,o.ClassName,k)elseif typeof(n)~='function'then h('invalidEventHandler',nil,k)else table.
insert(p,t:Connect(n))end end return l end return j end)()end,[29]=function()local b,c,d=a(29)local e return(function(
...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),d(f.Logging.logError),d(f.Utility.xtypeof)local function j(k:
string):PubTypes.SpecialKey local l={}l.type='SpecialKey'l.kind='Out'l.stage='observer'function l.apply(m,n:any,o:
Instance,p:{PubTypes.Task})local q,t=pcall(o.GetPropertyChangedSignal,o,k)if not q then h('invalidOutProperty',nil,o.
ClassName,k)elseif i(n)~='State'or n.kind~='Value'then h'invalidOutType'else n:set((o::any)[k])table.insert(p,t:Connect(
function()n:set((o::any)[k])end))table.insert(p,function()n:set(nil)end)end end return l end return j end)()end,[30]=
function()local b,c,d=a(30)local e return(function(...)local f=c.Parent.Parent local g,h,i,j=d(f.PubTypes),d(f.Logging.
logError),d(f.Utility.xtypeof),{}j.type='SpecialKey'j.kind='Ref'j.stage='observer'function j.apply(k,l:any,m:Instance,n:
{PubTypes.Task})if i(l)~='State'or l.kind~='Value'then h'invalidRefType'else l:set(m)table.insert(n,function()l:set(nil)
end)end end return j end)()end,[31]=function()local b,c,d=a(31)local e return(function(...)local f=c.Parent.Parent local
g,h,i,j,k=d(f.PubTypes),d(f.Utility.cleanup),d(f.Utility.xtypeof),d(f.Logging.logError),d(f.State.Observer)
local function l(m:Instance,n:string,o:any)(m::any)[n]=o end local function m(n:Instance,o:string)(n::any)[o]=(n::any)[o
]end local function n(o:Instance,p:string,q:any)if not pcall(l,o,p,q)then if not pcall(m,o,p)then if o==nil then j(
'setPropertyNilRef',nil,p,tostring(q))else j('cannotAssignProperty',nil,o.ClassName,p)end else local t,u=typeof(q),
typeof((o::any)[p])j('invalidPropertyType',nil,o.ClassName,p,u,t)end end end local function o(p:Instance,q:string,t:
PubTypes.CanBeState<any>,u:{PubTypes.Task})if i(t)=='State'then local v=false local function w()if not v then v=true
task.defer(function()v=false n(p,q,t:get(false))end)end end n(p,q,t:get(false))table.insert(u,k(t::any):onChange(w))else
n(p,q,t)end end local function p(q:PubTypes.PropertyTable,t:Instance)local u,v={self={}::{[PubTypes.SpecialKey]:any},
descendants={}::{[PubTypes.SpecialKey]:any},ancestor={}::{[PubTypes.SpecialKey]:any},observer={}::{[PubTypes.SpecialKey]
:any}},{}for w,x in pairs(q)do local y=i(w)if y=='string'then if w~='Parent'then o(t,w::string,x,v)end elseif y==
'SpecialKey'then local z=(w::PubTypes.SpecialKey).stage local A=u[z]if A==nil then j('unrecognisedPropertyStage',nil,z)
else A[w]=x end else j('unrecognisedPropertyKey',nil,i(w))end end for y,z in pairs(u.self)do y:apply(z,t,v)end for A,B
in pairs(u.descendants)do A:apply(B,t,v)end if q.Parent~=nil then o(t,'Parent',q.Parent,v)end for C,D in pairs(u.
ancestor)do C:apply(D,t,v)end for E,F in pairs(u.observer)do E:apply(F,t,v)end t.Destroying:Connect(function()h(v)end)
end return p end)()end,[32]=function()local b,c,d=a(32)local e return(function(...)return{ScreenGui={ResetOnSpawn=false,
ZIndexBehavior=Enum.ZIndexBehavior.Sibling},BillboardGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling}
,SurfaceGui={ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,SizingMode=Enum.SurfaceGuiSizingMode.
PixelsPerStud,PixelsPerStud=50},Frame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel
=0},ScrollingFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,
ScrollBarImageColor3=Color3.new(0,0,0)},TextLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),
BorderSizePixel=0,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextButton={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font
.SourceSans,Text='',TextColor3=Color3.new(0,0,0),TextSize=14},TextBox={BackgroundColor3=Color3.new(1,1,1),BorderColor3=
Color3.new(0,0,0),BorderSizePixel=0,ClearTextOnFocus=false,Font=Enum.Font.SourceSans,Text='',TextColor3=Color3.new(0,0,0
),TextSize=14},ImageLabel={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},
ImageButton={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0,AutoButtonColor=false},
ViewportFrame={BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},VideoFrame={
BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0},CanvasGroup={BackgroundColor3=
Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),BorderSizePixel=0}}end)()end,[34]=function()local b,c,d=a(34)local e
return(function(...)local f=c.Parent.Parent local g,h=d(f.Types),d(f.Logging.messages)local function i(j:string,k:Types.
Error?,...)local l:string if h[j]~=nil then l=h[j]else j='unknownMessage'l=h[j]end local m if k==nil then m=string.
format('[Fusion] '..l..'\n(ID: '..j..')',...)else l=l:gsub('ERROR_MESSAGE',k.message)m=string.format('[Fusion] '..l..
'\n(ID: '..j..')\n---- Stack trace ----\n'..k.trace,...)end error(m:gsub('\n','\n    '),0)end return i end)()end,[35]=
function()local b,c,d=a(35)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.Types),d(f.Logging.messages
)local function i(j:string,k:Types.Error?,...)local l:string if h[j]~=nil then l=h[j]else j='unknownMessage'l=h[j]end
local m if k==nil then m=string.format('[Fusion] '..l..'\n(ID: '..j..')',...)else l=l:gsub('ERROR_MESSAGE',k.message)m=
string.format('[Fusion] '..l..'\n(ID: '..j..')\n---- Stack trace ----\n'..k.trace,...)end task.spawn(function(...)error(
m:gsub('\n','\n    '),0)end,...)end return i end)()end,[36]=function()local b,c,d=a(36)local e return(function(...)local
f=c.Parent.Parent local g=d(f.Logging.messages)local function h(i,...)local j:string if g[i]~=nil then j=g[i]else i=
'unknownMessage'j=g[i]end warn(string.format('[Fusion] '..j..'\n(ID: '..i..')',...))end return h end)()end,[37]=function
()local b,c,d=a(37)local e return(function(...)return{cannotAssignProperty=
"The class type '%s' has no assignable property '%s'.",cannotConnectChange=
"The %s class doesn't have a property called '%s'.",cannotConnectEvent="The %s class doesn't have an event called '%s'."
,cannotCreateClass="Can't create a new instance of class '%s'.",computedCallbackError=
'Computed callback error: ERROR_MESSAGE',destructorNeededValue=
[[To save instances into Values, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededComputed=
[[To return instances from Computeds, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,multiReturnComputed=
[[Returning multiple values from Computeds is discouraged, as behaviour will change soon - see discussion #189 on GitHub.]]
,destructorNeededForKeys=
[[To return instances from ForKeys, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededForValues=
[[To return instances from ForValues, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,destructorNeededForPairs=
[[To return instances from ForPairs, provide a destructor function. This will be an error soon - see discussion #183 on GitHub.]]
,duplicatePropertyKey='',forKeysProcessorError='ForKeys callback error: ERROR_MESSAGE',forKeysKeyCollision=
[[ForKeys should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previously input key: '%s'; New input key: '%s']]
,forKeysDestructorError='ForKeys destructor error: ERROR_MESSAGE',forPairsDestructorError=
'ForPairs destructor error: ERROR_MESSAGE',forPairsKeyCollision=
[[ForPairs should only write to output key '%s' once when processing key changes, but it wrote to it twice. Previous input pair: '[%s] = %s'; New input pair: '[%s] = %s']]
,forPairsProcessorError='ForPairs callback error: ERROR_MESSAGE',forValuesProcessorError=
'ForValues callback error: ERROR_MESSAGE',forValuesDestructorError='ForValues destructor error: ERROR_MESSAGE',
invalidChangeHandler=[[The change handler for the '%s' property must be a function.]],invalidEventHandler=
"The handler for the '%s' event must be a function.",invalidPropertyType=
"'%s.%s' expected a '%s' type, but got a '%s' type.",invalidRefType='Instance refs must be Value objects.',
invalidOutType='[Out] properties must be given Value objects.',invalidOutProperty=
"The %s class doesn't have a property called '%s'.",invalidSpringDamping=
[[The damping ratio for a spring must be >= 0. (damping was %.2f)]],invalidSpringSpeed=
'The speed of a spring must be >= 0. (speed was %.2f)',mistypedSpringDamping=
'The damping ratio for a spring must be a number. (got a %s)',mistypedSpringSpeed=
'The speed of a spring must be a number. (got a %s)',mistypedTweenInfo=
'The tween info of a tween must be a TweenInfo. (got a %s)',springTypeMismatch=
"The type '%s' doesn't match the spring's type '%s'.",strictReadError="'%s' is not a valid member of '%s'.",
unknownMessage='Unknown error: ERROR_MESSAGE',unrecognisedChildType=
"'%s' type children aren't accepted by `[Children]`.",unrecognisedPropertyKey=
"'%s' keys aren't accepted in property tables.",unrecognisedPropertyStage=
[['%s' isn't a valid stage for a special key to be applied at.]]}end)()end,[38]=function()local b,c,d=a(38)local e
return(function(...)local f=c.Parent.Parent local g=d(f.Types)local function h(i:string):Types.Error return{type='Error'
,raw=i,message=i:gsub('^.+:%d+:%s*',''),trace=debug.traceback(nil,2)}end return h end)()end,[39]=function()local b,c,d=
a(39)local e return(function(...)type Set<T> ={[T]:any}export type Symbol={type:string,name:string}export type
Animatable=number|CFrame|Color3|ColorSequenceKeypoint|DateTime|NumberRange|NumberSequenceKeypoint|PhysicalProperties|Ray
|Rect|Region3|Region3int16|UDim|UDim2|Vector2|Vector2int16|Vector3|Vector3int16 export type Task=Instance|
RBXScriptConnection|(()->())|{destroy:(any)->()}|{Destroy:(any)->()}|{Task}export type Version={major:number,minor:
number,isRelease:boolean}export type Dependency={dependentSet:Set<Dependent>}export type Dependent={update:(Dependent)->
boolean,dependencySet:Set<Dependency>}export type StateObject<T> =Dependency&{type:string,kind:string,get:(StateObject<T
>,asDependency:boolean?)->T}export type CanBeState<T> =StateObject<T>|T export type Value<T> =StateObject<T>&{set:(Value
<T>,newValue:any,force:boolean?)->()}export type Computed<T> =StateObject<T>&Dependent&{}export type ForPairs<KO,VO> =
StateObject<{[KO]:VO}>&Dependent&{}export type ForKeys<KO,V> =StateObject<{[KO]:V}>&Dependent&{}export type ForValues<K,
VO> =StateObject<{[K]:VO}>&Dependent&{}export type Tween<T> =StateObject<T>&Dependent&{}export type Spring<T> =
StateObject<T>&Dependent&{}export type Observer=Dependent&{onChange:(Observer,callback:()->())->(()->())}export type
SpecialKey={type:string,kind:string,stage:string,apply:(SpecialKey,value:any,applyTo:Instance,cleanupTasks:{Task})->()}
export type Children=Instance|StateObject<Children>|{[any]:Children}export type PropertyTable={[string|SpecialKey]:any}
return nil end)()end,[41]=function()local b,c,d=a(41)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k
,l,m,n,o=d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.initDependency),d(f.Dependencies.
useDependency),d(f.Logging.logErrorNonFatal),d(f.Logging.logWarn),d(f.Utility.isSimilar),d(f.Utility.needsDestruction),{
}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false then j(t)end return t._value end
function o.update(t):boolean for u in pairs(t.dependencySet)do u.dependentSet[t]=nil end t._oldDependencySet,t.
dependencySet=t.dependencySet,t._oldDependencySet table.clear(t.dependencySet)local v,E,F=h(t.dependencySet,t._processor
)if v then if t._destructor==nil and n(E)then l'destructorNeededComputed'end if F~=nil then l'multiReturnComputed'end
local G=t._value local H=m(G,E)if t._destructor~=nil then t._destructor(G)end t._value=E for I in pairs(t.dependencySet)
do I.dependentSet[t]=true end return not H else k('computedCallbackError',E)t._oldDependencySet,t.dependencySet=t.
dependencySet,t._oldDependencySet for G in pairs(t.dependencySet)do G.dependentSet[t]=true end return false end end
local function t<T>(u:()->T,v:((T)->())?):Types.Computed<T>local E=setmetatable({type='State',kind='Computed',
dependencySet={},dependentSet=setmetatable({},q),_oldDependencySet={},_processor=u,_destructor=v,_value=nil},p)i(E)E:
update()return E end return t end)()end,[42]=function()local b,c,d=a(42)local e return(function(...)local f=c.Parent.
Parent local g,h,i,j,k,l,m,n,o,p,q,t=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.
initDependency),d(f.Dependencies.useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.Logging.
logError),d(f.Logging.logWarn),d(f.Utility.cleanup),d(f.Utility.needsDestruction),{}local u,v={__index=t},{__mode='k'}
function t.get(E,F:boolean?):any if F~=false then k(E)end return E._outputTable end function t.update(E):boolean local F
=E._inputIsState local G,H,I,J,K,L,M=if F then E._inputTable:get(false)else E._inputTable,E._oldInputTable,E.
_outputTable,E._keyOIMap,E._keyIOMap,E._meta,false for N in pairs(E.dependencySet)do N.dependentSet[E]=nil end E.
_oldDependencySet,E.dependencySet=E.dependencySet,E._oldDependencySet table.clear(E.dependencySet)if F then E.
_inputTable.dependentSet[E]=true E.dependencySet[E._inputTable]=true end for O,P in pairs(G)do local Q=E._keyData[O]if Q
==nil then Q={dependencySet=setmetatable({},v),oldDependencySet=setmetatable({},v),dependencyValues=setmetatable({},v)}E
._keyData[O]=Q end local R=H[O]==nil if R==false then for S,T in pairs(Q.dependencyValues)do if T~=S:get(false)then R=
true break end end end if R then Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet table.clear(Q.
dependencySet)local S,T,U=i(Q.dependencySet,E._processor,O)if S then if E._destructor==nil and(q(T)or q(U))then o
'destructorNeededForKeys'end local V,W=J[T],K[O]if V~=O and G[V]~=nil then n('forKeysKeyCollision',nil,tostring(T),
tostring(V),tostring(T))end if W~=T and J[W]==O then local X=L[W]local Y,Z=xpcall(E._destructor or p,l,W,X)if not Y then
m('forKeysDestructorError',Z)end J[W]=nil I[W]=nil L[W]=nil end H[O]=P L[T]=U J[T]=O K[O]=T I[T]=P M=true else Q.
oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet m('forKeysProcessorError',T)end end for S in pairs(Q
.dependencySet)do Q.dependencyValues[S]=S:get(false)E.dependencySet[S]=true S.dependentSet[E]=true end end for Q,R in
pairs(J)do if G[R]==nil then local S=L[Q]local T,U=xpcall(E._destructor or p,l,Q,S)if not T then m(
'forKeysDestructorError',U)end H[R]=nil L[Q]=nil J[Q]=nil K[R]=nil I[Q]=nil E._keyData[R]=nil M=true end end return M
end local function E<KI,KO,M>(F:PubTypes.CanBeState<{[KI]:any}>,G:(KI)->(KO,M?),H:((KO,M?)->())?):Types.ForKeys<KI,KO,M>
local I=F.type=='State'and typeof(F.get)=='function'local J=setmetatable({type='State',kind='ForKeys',dependencySet={},
dependentSet=setmetatable({},v),_oldDependencySet={},_processor=G,_destructor=H,_inputIsState=I,_inputTable=F,
_oldInputTable={},_outputTable={},_keyOIMap={},_keyIOMap={},_keyData={},_meta={}},u)j(J)J:update()return J end return E
end)()end,[43]=function()local b,c,d=a(43)local e return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o,p,
q,t=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.Dependencies.initDependency),d(f.Dependencies.
useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.Logging.logError),d(f.Logging.logWarn),d(f.
Utility.cleanup),d(f.Utility.needsDestruction),{}local u,v={__index=t},{__mode='k'}function t.get(E,F:boolean?):any if F
~=false then k(E)end return E._outputTable end function t.update(E):boolean local F=E._inputIsState local G,H,I,J,K=if F
then E._inputTable:get(false)else E._inputTable,E._oldInputTable,E._keyIOMap,E._meta,false for L in pairs(E.
dependencySet)do L.dependentSet[E]=nil end E._oldDependencySet,E.dependencySet=E.dependencySet,E._oldDependencySet table
.clear(E.dependencySet)if F then E._inputTable.dependentSet[E]=true E.dependencySet[E._inputTable]=true end E.
_oldOutputTable,E._outputTable=E._outputTable,E._oldOutputTable local M,N=E._oldOutputTable,E._outputTable table.clear(N
)for O,P in pairs(G)do local Q=E._keyData[O]if Q==nil then Q={dependencySet=setmetatable({},v),oldDependencySet=
setmetatable({},v),dependencyValues=setmetatable({},v)}E._keyData[O]=Q end local R=H[O]~=P if R==false then for S,T in
pairs(Q.dependencyValues)do if T~=S:get(false)then R=true break end end end if R then Q.oldDependencySet,Q.dependencySet
=Q.dependencySet,Q.oldDependencySet table.clear(Q.dependencySet)local S,T,U,V=i(Q.dependencySet,E._processor,O,P)if S
then if E._destructor==nil and(q(T)or q(U)or q(V))then o'destructorNeededForPairs'end if N[T]~=nil then local W,X for Y,
Z in pairs(I)do if Z==T then X=G[Y]if X~=nil then W=Y break end end end if W~=nil then n('forPairsKeyCollision',nil,
tostring(T),tostring(W),tostring(X),tostring(O),tostring(P))end end local W=M[T]if W~=U then local X=J[T]if W~=nil then
local Y,Z=xpcall(E._destructor or p,l,T,W,X)if not Y then m('forPairsDestructorError',Z)end end M[T]=nil end H[O]=P I[O]
=T J[T]=V N[T]=U K=true else Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.oldDependencySet m(
'forPairsProcessorError',T)end else local S=I[O]if N[S]~=nil then local T,U for V,W in pairs(I)do if S==W then U=G[V]if
U~=nil then T=V break end end end if T~=nil then n('forPairsKeyCollision',nil,tostring(S),tostring(T),tostring(U),
tostring(O),tostring(P))end end N[S]=M[S]end for S in pairs(Q.dependencySet)do Q.dependencyValues[S]=S:get(false)E.
dependencySet[S]=true S.dependentSet[E]=true end end for Q,R in pairs(M)do if N[Q]~=R then local S=J[Q]if R~=nil then
local T,U=xpcall(E._destructor or p,l,Q,R,S)if not T then m('forPairsDestructorError',U)end end if N[Q]==nil then J[Q]=
nil E._keyData[Q]=nil end K=true end end for S in pairs(H)do if G[S]==nil then H[S]=nil I[S]=nil end end return K end
local function E<KI,VI,KO,VO,M>(F:PubTypes.CanBeState<{[KI]:VI}>,G:(KI,VI)->(KO,VO,M?),H:((KO,VO,M?)->())?):Types.
ForPairs<KI,VI,KO,VO,M>local I=F.type=='State'and typeof(F.get)=='function'local J=setmetatable({type='State',kind=
'ForPairs',dependencySet={},dependentSet=setmetatable({},v),_oldDependencySet={},_processor=G,_destructor=H,
_inputIsState=I,_inputTable=F,_oldInputTable={},_outputTable={},_oldOutputTable={},_keyIOMap={},_keyData={},_meta={}},u)
j(J)J:update()return J end return E end)()end,[44]=function()local b,c,d=a(44)local e return(function(...)local f=c.
Parent.Parent local g,h,i,j,k,l,m,n,o,p,q=d(f.PubTypes),d(f.Types),d(f.Dependencies.captureDependencies),d(f.
Dependencies.initDependency),d(f.Dependencies.useDependency),d(f.Logging.parseError),d(f.Logging.logErrorNonFatal),d(f.
Logging.logWarn),d(f.Utility.cleanup),d(f.Utility.needsDestruction),{}local t,u={__index=q},{__mode='k'}function q.get(v
,E:boolean?):any if E~=false then k(v)end return v._outputTable end function q.update(v):boolean local E=v._inputIsState
local F,G,H=if E then v._inputTable:get(false)else v._inputTable,{},false v._oldValueCache,v._valueCache=v._valueCache,v
._oldValueCache local I,J=v._valueCache,v._oldValueCache table.clear(I)for K in pairs(v.dependencySet)do K.dependentSet[
v]=nil end v._oldDependencySet,v.dependencySet=v.dependencySet,v._oldDependencySet table.clear(v.dependencySet)if E then
v._inputTable.dependentSet[v]=true v.dependencySet[v._inputTable]=true end for L,M in pairs(F)do local N=J[M]local O,P,Q
,R=(N==nil)if type(N)=='table'and#N>0 then local S=table.remove(N,#N)P=S.value Q=S.valueData R=S.meta if#N<=0 then J[M]=
nil end elseif N~=nil then J[M]=nil O=true end if Q==nil then Q={dependencySet=setmetatable({},u),oldDependencySet=
setmetatable({},u),dependencyValues=setmetatable({},u)}end if O==false then for S,T in pairs(Q.dependencyValues)do if T
~=S:get(false)then O=true break end end end if O then Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.
oldDependencySet table.clear(Q.dependencySet)local S,T,U=i(Q.dependencySet,v._processor,M)if S then if v._destructor==
nil and(p(T)or p(U))then n'destructorNeededForValues'end if P~=nil then local V,W=xpcall(v._destructor or o,l,P,R)if not
V then m('forValuesDestructorError',W)end end P=T R=U H=true else Q.oldDependencySet,Q.dependencySet=Q.dependencySet,Q.
oldDependencySet m('forValuesProcessorError',T)end end local S=I[M]if S==nil then S={}I[M]=S end table.insert(S,{value=P
,valueData=Q,meta=R})G[L]=P for T in pairs(Q.dependencySet)do Q.dependencyValues[T]=T:get(false)v.dependencySet[T]=true
T.dependentSet[v]=true end end for N,O in pairs(J)do for P,Q in ipairs(O)do local R,S=Q.value,Q.meta local T,U=xpcall(v.
_destructor or o,l,R,S)if not T then m('forValuesDestructorError',U)end H=true end table.clear(O)end v._outputTable=G
return H end local function v<VI,VO,M>(E:PubTypes.CanBeState<{[any]:VI}>,F:(VI)->(VO,M?),G:((VO,M?)->())?):Types.
ForValues<VI,VO,M>local H=E.type=='State'and typeof(E.get)=='function'local I=setmetatable({type='State',kind=
'ForValues',dependencySet={},dependentSet=setmetatable({},u),_oldDependencySet={},_processor=F,_destructor=G,
_inputIsState=H,_inputTable=E,_outputTable={},_valueCache={},_oldValueCache={}},t)j(I)I:update()return I end return v
end)()end,[45]=function()local b,c,d=a(45)local e return(function(...)local f=c.Parent.Parent local g,h,i=d(f.PubTypes),
d(f.Types),d(f.Dependencies.initDependency)type Set<T> ={[T]:any}local j={}local k,l:Set<Types.Observer> ={__index=j},{}
function j.update(m):boolean for n,o in pairs(m._changeListeners)do task.spawn(o)end return false end function j.
onChange(m,n:()->()):()->()local o={}m._numChangeListeners+=1 m._changeListeners[o]=n l[m]=true local p=false return
function()if p then return end p=true m._changeListeners[o]=nil m._numChangeListeners-=1 if m._numChangeListeners==0
then l[m]=nil end end end local function m(n:PubTypes.Value<any>):Types.Observer local o=setmetatable({type='State',kind
='Observer',dependencySet={[n]=true},dependentSet={},_changeListeners={},_numChangeListeners=0},k)i(o)n.dependentSet[o]=
true return o end return m end)()end,[46]=function()local b,c,d=a(46)local e return(function(...)local f=c.Parent.Parent
local g,h,i,j,k,l=d(f.Types),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Dependencies.updateAll
),d(f.Utility.isSimilar),{}local m,n={__index=l},{__mode='k'}function l.get(o,p:boolean?):any if p~=false then h(o)end
return o._value end function l.set(o,p:any,q:boolean?)local t=o._value if q or not k(t,p)then o._value=p j(o)end end
local function o<T>(p:T):Types.State<T>local q=setmetatable({type='State',kind='Value',dependentSet=setmetatable({},n),
_value=p},m)i(q)return q end return o end)()end,[47]=function()local b,c,d=a(47)local e return(function(...)local f=c.
Parent.Parent local g,h=d(f.PubTypes),d(f.Utility.xtypeof)local function i<T>(j:PubTypes.CanBeState<T>,k:boolean?):T
return if h(j)=='State'then(j::PubTypes.StateObject<T>):get(k)else(j::T)end return i end)()end,[48]=function()local b,c,
d=a(48)local e return(function(...)local f=c.Parent local g=d(f.PubTypes)type Set<T> ={[T]:any}export type None=PubTypes
.Symbol&{}export type Error={type:string,raw:string,message:string,trace:string}export type State<T> =PubTypes.Value<T>&
{_value:T}export type Computed<T> =PubTypes.Computed<T>&{_oldDependencySet:Set<PubTypes.Dependency>,_callback:()->T,
_value:T}export type ForPairs<KI,VI,KO,VO,M> =PubTypes.ForPairs<KO,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,
_processor:(KI,VI)->(KO,VO),_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:VI}>,
_oldInputTable:{[KI]:VI},_outputTable:{[KO]:VO},_oldOutputTable:{[KO]:VO},_keyIOMap:{[KI]:KO},_meta:{[KO]:M?},_keyData:{
[KI]:{dependencySet:Set<PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.
Dependency]:any}}}}export type ForKeys<KI,KO,M> =PubTypes.ForKeys<KO,any>&{_oldDependencySet:Set<PubTypes.Dependency>,
_processor:(KI)->(KO),_destructor:(KO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[KI]:KO}>,
_oldInputTable:{[KI]:KO},_outputTable:{[KO]:any},_keyOIMap:{[KO]:KI},_meta:{[KO]:M?},_keyData:{[KI]:{dependencySet:Set<
PubTypes.Dependency>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export
type ForValues<VI,VO,M> =PubTypes.ForValues<any,VO>&{_oldDependencySet:Set<PubTypes.Dependency>,_processor:(VI)->(VO),
_destructor:(VO,M?)->(),_inputIsState:boolean,_inputTable:PubTypes.CanBeState<{[VI]:VO}>,_outputTable:{[any]:VI},
_valueCache:{[VO]:any},_oldValueCache:{[VO]:any},_meta:{[VO]:M?},_valueData:{[VI]:{dependencySet:Set<PubTypes.Dependency
>,oldDependencySet:Set<PubTypes.Dependency>,dependencyValues:{[PubTypes.Dependency]:any}}}}export type Tween<T> =
PubTypes.Tween<T>&{_goalState:State<T>,_tweenInfo:TweenInfo,_prevValue:T,_nextValue:T,_currentValue:T,_currentTweenInfo:
TweenInfo,_currentTweenDuration:number,_currentTweenStartTime:number,_currentlyAnimating:boolean}export type Spring<T> =
PubTypes.Spring<T>&{_speed:PubTypes.CanBeState<number>,_speedIsState:boolean,_lastSpeed:number,_damping:PubTypes.
CanBeState<number>,_dampingIsState:boolean,_lastDamping:number,_goalState:State<T>,_goalValue:T,_currentType:string,
_currentValue:T,_springPositions:{number},_springGoals:{number},_springVelocities:{number}}export type Observer=PubTypes
.Observer&{_changeListeners:Set<()->()>,_numChangeListeners:number}return nil end)()end,[50]=function()local b,c,d=a(50)
local e return(function(...)local f=c.Parent.Parent local g=d(f.Types)return{type='Symbol',name='None'}::Types.None end
)()end,[51]=function()local b,c,d=a(51)local e return(function(...)local function f(g:any)local h=typeof(g)if h==
'Instance'then g:Destroy()elseif h=='RBXScriptConnection'then g:Disconnect()elseif h=='function'then g()elseif h==
'table'then if typeof(g.destroy)=='function'then g:destroy()elseif typeof(g.Destroy)=='function'then g:Destroy()elseif g
[1]~=nil then for i,j in ipairs(g)do f(j)end end end end local function g(...:any)for h=1,select('#',...)do f(select(h,
...))end end return g end)()end,[52]=function()local b,c,d=a(52)local e return(function(...)local function f(...:any)end
return f end)()end,[53]=function()local b,c,d=a(53)local e return(function(...)local function f(g:any,h:any):boolean if
typeof(g)=='table'then return false else return g==h end end return f end)()end,[54]=function()local b,c,d=a(54)local e
return(function(...)local function f(g:any):boolean return typeof(g)=='Instance'end return f end)()end,[55]=function()
local b,c,d=a(55)local e return(function(...)local f=c.Parent.Parent local g=d(f.Logging.logError)type table={[any]:any}
local function h(i:string,j:table):table local k=getmetatable(j::any)if k==nil then k={}setmetatable(j,k)end function k.
__index(l,m)g('strictReadError',nil,tostring(m),i)end return j end return h end)()end,[56]=function()local b,c,d=a(56)
local e return(function(...)local function f(g:any)local h=typeof(g)if h=='table'and typeof(g.type)=='string'then return
g.type else return h end end return f end)()end,[57]=function()local b,c,d=a(57)local e return(function(...)local f,g,h=
{},false,{'Value','Chance','Sequence','String','Convert','Check','Notation','Random','Matrix','Special'}for i=1,#h,1 do
f[h[i] ]={}end function f.Value.EulersNumber(i)return math.exp(1)end function f.Value.EulersConstant(i)return
0.577215664901 end function f.Value.GammaCoeff(i)return-0.65587807152056 end function f.Value.GammaQuad(i)return-
4.2002635033944E-2 end function f.Value.GammaQui(i)return 0.16653861138228 end function f.Value.GammaSet(i)return-
4.2197734555571E-2 end function f.Value.GoldenRatio(i)return(1+math.sqrt(5))/2 end function f.Value.Tau(i)return math.pi
*2 end function f.Value.AperysConstant(i)return 1.20205690315732 end function f.Value.BelphegorsPrimeNumber(i)return
1000000000000066600000000000000 end function f.Chance.Mean(i,j)if type(j)=='table'and j[1]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end table.sort(j)local k=0 for l=1,#j,1 do k+=j[l]end return k/#j end
function f.Chance.Median(i,j)if type(j)=='table'and j[1]then else return warn'only tables are allowed in this function'
end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end table.
sort(j)if#j~=1 and#j~=2 then repeat wait()table.remove(j,1)table.remove(j,#j)until#j==1 or#j==2 end if#j==2 then local k
=j[#j]-j[1]return j[1]+(k/2)else return j[#j]end end function f.Chance.Mode(i,j)if type(j)=='table'and j[1]then else
return warn'only tables are allowed in this function'end table.sort(j)local k,l,m={},{},0 for n,o in pairs(j)do k[o]=k[o
]and k[o]+1 or 1 end for p,q in pairs(k)do if q>m then m=q l={p}elseif q==m then table.insert(l,p)end end return l,m end
function f.Chance.Range(i,j)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'
end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end table.
sort(j)return j[#j]-j[1]end function f.Chance.MidRange(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end table.sort(j)return(j[#j]+j[1])/2 end function f.Chance.FirstQuartile(i,j
)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end for k=1,#j,1 do if
typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end table.sort(j)if#j%2==0 then
for k=1,#j/2,1 do table.remove(j,#j)end else for k=1,((#j-1)/2)+1,1 do table.remove(j,#j)end end return f.Chance:Median(
j)end function f.Chance.ThirdQuartile(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end table.sort(j)if#j%2==0 then for k=1,#j/2,1 do table.remove(j,1)end else
for k=1,((#j-1)/2)+1,1 do table.remove(j,1)end end return f.Chance:Median(j)end function f.Chance.InterquartileRange(i,j
)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end for k=1,#j,1 do if
typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end table.sort(j)local k,l={},{}
for m=1,#j,1 do table.insert(k,j[m])table.insert(l,j[m])end return f.Chance:ThirdQuartile(k)-f.Chance:FirstQuartile(l)
end function f.Chance.StandardDeviation(i,j)if type(j)=='table'and j[1]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end table.sort(j)local k=f.Chance:Mean(j)for l=1,#j,1 do j[l]=(j[l]-k)^2 end
return math.sqrt(f.Chance:Mean(j))end function f.Chance.ZScore(i,j)if type(j)=='table'and j[1]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end local k,l={},{}for m=1,#j,1 do table.insert(k,j[m])table.insert(l,j[m])
end table.sort(k)table.sort(l)local m,p=f.Chance:Mean(k),f.Chance:StandardDeviation(l)for q=1,#j,1 do j[q]=(j[q]-m)/p
end return j end function f.Chance.Permutation(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"end for k=1,#j,1
do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k,l=j[1],j[2]
return f.Special:Factorial(k)/f.Special:Factorial(k-l)end function f.Chance.Combination(i,j)if type(j)=='table'and j[2]
then else return warn'only tables are allowed in this function'end if j[3]then return warn
"you can't have three table values"end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end local k,l=j[1],j[2]return f.Special:Factorial(k)/(f.Special:Factorial(l)*
f.Special:Factorial(k-l))end function f.Sequence.ThueMorse(i,j)if typeof(j)=='number'then else return warn
'only numbers are allowed'end if j%1==0 and math.abs(j)+j~=0 then else return warn
'number has to be a positive whole number'end local k='0'for l=1,j,1 do local m=''for p in k:gmatch'.'do m..=math.abs(
tonumber(p)-1)end k..=m end return k end function f.Sequence.Integer(i,j)if type(j)=='table'and j[2]then else return
warn'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"end for k=1,
#j,1 do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k,l,m=j[1],j[
2],{}if k>l then return warn"min can't be greater than max"end if k%1~=0 or l%1~=0 then return warn
'min and max have to be whole numbers'end if k<=0 or l<=0 then return warn"min or max can't be lower than or equal to 0"
end table.insert(m,'0')for p=1,l-1,1 do if p>=k then table.insert(m,'\177'..p)end end return m end function f.Sequence.
Prime(i,j)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end if j[3]then
return warn"you can't have three table values"end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end local k,l,m=j[1],j[2],{}if k>l then return warn
"min can't be greater than max"end if k%1~=0 or l%1~=0 then return warn'min and max have to be whole numbers'end if k<=0
or l<=0 then return warn"min or max can't be lower than or equal to 0"end local p=2 while true do wait()if#m==l then
break end if f.Check:Prime(p)then table.insert(m,p)end if p==2 then p+=1 else p+=2 end end for q=1,k-1,1 do table.
remove(m,1)end return m end function f.Sequence.Unprimeable(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"end for k=1,#j,1
do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k,l,m=j[1],j[2],{}
if k>l then return warn"min can't be greater than max"end if k%1~=0 or l%1~=0 then return warn
'min and max have to be whole numbers'end if k<=0 or l<=0 then return warn"min or max can't be lower than or equal to 0"
end local p=200 while true do wait()if#m==l then break end if f.Check:Unprimeable(p)then table.insert(m,p)end p+=1 end
for q=1,k-1,1 do table.remove(m,1)end return m end function f.String.JaroSimilarity(i,j)if type(j)=='table'and j[2]then
else return warn'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"
end for k=1,#j,1 do if typeof(j[k])=='string'then else return warn'only strings are allowed in the table'end end local k
=false if g==true then g=false k=true end local l,m=j[1],j[2]local p,q,t,u,v,E,F,G=string.len(l),string.len(m),{},{},{},
{},{},{}if p==0 and q==0 then return 1 end if p==0 or q==0 then return 0 end local H,I=0,0 for J in l:gmatch'.'do if not
table.find(t,J)then table.insert(t,J)else local K=0 while true do wait()K+=1 if not table.find(t,J..K)then table.insert(
t,J..K)break end end end end for K in m:gmatch'.'do if not table.find(u,K)then table.insert(u,K)else local L=0 while
true do wait()L+=1 if not table.find(u,K..L)then table.insert(u,K..L)break end end end end for L,M in pairs(t)do for N,O
in pairs(u)do if t[L]==u[N]then table.insert(v,t[L])table.insert(E,u[N])H+=1 break end end end if H==0 then return 0 end
for N=1,#t,1 do if table.find(v,t[N])then table.insert(F,t[N])end end for N=1,#u,1 do if table.find(E,u[N])then table.
insert(G,u[N])end end for N=1,#t or#u,1 do if t[N]~=u[N]then if k==true then return N-1 end end end for N=1,#F or#G,1 do
if F[N]~=G[N]then I+=0.5 end end return((H/p)+(H/q)+((H-I)/H))/3 end function f.String.JaroDistance(i,j)return 1-f.
String:JaroSimilarity(j)end function f.String.JaroWinklerSimilarity(i,j)local k=f.String:JaroSimilarity(j)g=true local l
=f.String:JaroSimilarity(j)l=math.min(l,4)return k+0.1*l*(1-k)end function f.String.JaroWinklerDistance(i,j)return 1-f.
String:JaroWinklerSimilarity(j)end function f.String.LevenshteinDistance(i,j)if type(j)=='table'and j[2]then else return
warn'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"end for k=1,
#j,1 do if typeof(j[k])=='string'then else return warn'only strings are allowed in the table'end end local k,l=j[1],j[2]
local m,p=string.len(k),string.len(l)if k==''then return p end if l==''then return m end local q,t=k:sub(2,-1),l:sub(2,-
1)if k:sub(0,1)==l:sub(0,1)then return f.String:LevenshteinDistance{q,t}end return 1+math.min(f.String:
LevenshteinDistance{q,t},f.String:LevenshteinDistance{k,t},f.String:LevenshteinDistance{q,l})end function f.Convert.
DecimalToBase(i,j)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end if j[3]
then return warn"you can't have three table values"end for k=1,#j,1 do if typeof(j[k])=='number'and j[2]%1==0 then else
return warn[[only numbers are allowed in the table, also bases have to be whole numbers]]end end if j[2]>36 then return
warn'no bases above 36 are allowed'end if j[2]<1 then return warn'no bases below 1 are allowed'end if j[2]==10 then
return warn'base 10 is not allowed'end local k,l,m,p,q,t,u,v=j[1],j[2],'','',{},{},{},{[10]='A',[11]='B',[12]='C',[13]=
'D',[14]='E',[15]='F',[16]='G',[17]='H',[18]='I',[19]='J',[20]='K',[21]='L',[22]='M',[23]='N',[24]='O',[25]='P',[26]='Q'
,[27]='R',[28]='S',[29]='T',[30]='U',[31]='V',[32]='W',[33]='X',[34]='Y',[35]='Z'}if math.abs(k)+k==0 and k~=0 then k=
math.abs(k)p='-'end if k%1~=0 then local E=math.floor(k-(k%1))m=E local F=0 while true do wait()F+=1 if(k*(10^F))%1==0
then break end end m=tonumber(string.format('%.'..(F or 0)..'f',k-m))k=E local G=10^-math.log10(m)m*=G repeat wait()if
table.find(u,m)then break end table.insert(u,m)m*=l local H=math.floor(m/G)if H>=10 then for I,K in pairs(v)do if I==H
then H=K end end end table.insert(t,H)if H>=1 and not(m==G)then m-=(H*G)end until m==G if E==0 then m='0.'else m='.'end
for H=1,#t,1 do m..=t[H]end if E==0 then return p..m end end repeat wait()local E=k%l if E>=10 then for F,G in pairs(v)
do if F==E then E=G end end end table.insert(q,E)k=math.floor(k/l)until k/l==0 for E=1,math.floor(#q/2),1 do local F=#q-
E+1 q[E],q[F]=q[F],q[E]end l=''for E=1,#q,1 do l..=q[E]end return p..l..m end function f.Convert.BaseToDecimal(i,j)if
type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end if j[3]then return warn
"you can't have three table values"end for k=1,#j,1 do if j[2]%1==0 then else return warn
'bases have to be whole numbers'end end if j[2]>36 then return warn'no bases above 36 are allowed'end if j[2]<1 then
return warn'no bases below 1 are allowed'end if j[2]==10 then return warn'base 10 is not allowed'end local k,l,m,p,q,t,u
=j[1],j[2],'','',false,{},{[0]='0',[1]='1',[2]='2',[3]='3',[4]='4',[5]='5',[6]='6',[7]='7',[8]='8',[9]='9',[10]='A',[11]
='B',[12]='C',[13]='D',[14]='E',[15]='F',[16]='G',[17]='H',[18]='I',[19]='J',[20]='K',[21]='L',[22]='M',[23]='N',[24]=
'O',[25]='P',[26]='Q',[27]='R',[28]='S',[29]='T',[30]='U',[31]='V',[32]='W',[33]='X',[34]='Y',[35]='Z'}if math.abs(k)+k
==0 and k~=0 then k=math.abs(k)p='-'end for v in tostring(k):gmatch'.'do if q==true then table.insert(t,v)end if v=='.'
then q=true end for E=1,#u,1 do if table.find(u,v,E)and E>=l then return warn
'make sure your base value is in order with your base'end end end for E=1,math.floor(#t/2),1 do local F=#t-E+1 t[E],t[F]
=t[F],t[E]end local E,F=math.floor(k-(k%1)),k%1~=0 m=E local G=0 while true do wait()G+=1 if(k*(10^G))%1==0 then break
end end m=tonumber(string.format('%.'..(G or 0)..'f',k-m))k=E if F then for H=1,#t,1 do local I=t[H]for K=1,#u,1 do if
table.find(u,I,K)then I=u[K]end end if H==1 then m=(I+0)/l else m=(I+m)/l end end if E==0 then return p..m end end l=
tonumber(k,l)return p..l+m end function f.Convert.BaseToBase(i,j)if type(j)=='table'and j[3]then else return warn
'only tables are allowed in this function'end if j[4]then return warn"you can't have four table values"end for k=1,#j,1
do if j[2]%1==0 and j[3]%1==0 then else return warn'bases have to be whole numbers'end end if j[2]>36 or j[3]>36 then
return warn'no bases above 36 are allowed'end if j[2]<1 or j[3]<1 then return warn'no bases below 1 are allowed'end
local k,l,m,p=j[1],j[2],j[3],{[0]='0',[1]='1',[2]='2',[3]='3',[4]='4',[5]='5',[6]='6',[7]='7',[8]='8',[9]='9',[10]='A',[
11]='B',[12]='C',[13]='D',[14]='E',[15]='F',[16]='G',[17]='H',[18]='I',[19]='J',[20]='K',[21]='L',[22]='M',[23]='N',[24]
='O',[25]='P',[26]='Q',[27]='R',[28]='S',[29]='T',[30]='U',[31]='V',[32]='W',[33]='X',[34]='Y',[35]='Z'}for q in
tostring(k):gmatch'.'do for t=1,#p,1 do if table.find(p,q,t)and t>=l then return warn
'make sure your base value is in order with your base'end end end return f.Convert:DecimalToBase{tonumber(f.Convert:
BaseToDecimal{k,l}),m}end function f.Convert.DecimalToRomanNumeral(i,j)if typeof(j)=='number'then else return warn
'only numbers are allowed'end if j==0 then return warn"number can't be 0"end local k,l='',{{1000,'M'},{900,'CM'},{500,
'D'},{400,'CD'},{100,'C'},{90,'XC'},{50,'L'},{40,'XL'},{10,'X'},{9,'IX'},{5,'V'},{4,'IV'},{1,'I'}}for m,p in pairs(l)do
local q,t=unpack(p)while j>=q do j-=q k..=t end end return k end function f.Convert.RomanNumeralToDecimal(i,j)if typeof(
j)=='string'then else return warn'only roman numerals are allowed'end local k,l,m,p=0,1,string.len(j),{M=1000,D=500,C=
100,L=50,X=10,V=5,I=1}for q in tostring(j):gmatch'.'do local t=false for u,v in pairs(p)do if q==u then t=true end end
if t==false then return warn'make sure your Roman Numerals are using the correct letters'end end while l<m do local t,u=
p[string.sub(j,l,l)],p[string.sub(j,l+1,l+1)]if t<u then k+=(u-t)l+=2 else k+=t l+=1 end end if l<=m then k+=p[string.
sub(j,l,l)]end return k end function f.Convert.FahrenheitToCelsius(i,j)if typeof(j)=='number'then else return warn
'only numbers are allowed'end return(j-32)*(0.5555555555555556)end function f.Convert.CelsiusToFahrenheit(i,j)if typeof(
j)=='number'then else return warn'only numbers are allowed'end return(j*(1.8))+32 end function f.Check.Integer(i,j)if
typeof(j)=='number'then else return false end if j%1==0 then return true else return false end end function f.Check.
NonInteger(i,j)if typeof(j)=='number'then else return false end if j%1~=0 then return true else return false end end
function f.Check.Prime(i,j)if typeof(j)=='number'then else return false end if j<1 then return false end if j%1~=0 then
return false end if j>2 and j%2==0 then return false end for k=2,j^(0.5)do if(j%k)==0 then return false end end return
true end function f.Check.Unprimeable(i,j)if typeof(j)=='number'then else return false end if f.Check:Prime(j)==true
then return false end if j%1~=0 then return false end local k,l=tostring(j),tostring(j)local m,p=string.len(k),0 for q=1
,m*10,1 do local t=math.ceil(q/10)if t>p then k=l end p=t local u=q-(9*(t-1))-t k=table.concat{k:sub(1,t-1),u,k:sub(t+1)
}if f.Check:Prime(tonumber(k))==true then return false end end return true end function f.Notation.Scientific(i,j)if
typeof(j)=='number'then else return warn'only numbers are allowed'end if j==0 then return warn"number can't be 0"end
local k=0 if math.abs(j)>=10 then if string.match(j,'^-')then repeat k+=1 j/=10 until j>-10 return j..' * 10^'..k else
repeat k+=1 j/=10 until j<10 return j..' * 10^'..k end elseif math.abs(j)<1 then if string.match(j,'^-')then repeat k+=1
j*=10 until j<=-1 return j..' * 10^'..-k else repeat k+=1 j*=10 until j>=1 return j..' * 10^'..-k end end end function f
.Notation.E(i,j)if typeof(j)=='number'then else return warn'only numbers are allowed'end if j==0 then return warn
"number can't be 0"end local k=0 if math.abs(j)>=10 then if string.match(j,'^-')then repeat k+=1 j/=10 until j>-10
return j..'e+'..k else repeat k+=1 j/=10 until j<10 return j..'e+'..k end elseif math.abs(j)<1 then if string.match(j,
'^-')then repeat k+=1 j*=10 until j<=-1 return j..'e'..-k else repeat k+=1 j*=10 until j>=1 return j..'e'..-k end end
end function f.Notation.Engineering(i,j)if typeof(j)=='number'then else return warn'only numbers are allowed'end if j==0
then return warn"number can't be 0"end local k=0 if math.abs(j)>=10 then if string.match(j,'^-')then repeat k+=1 j/=10
until j>-10 else repeat k+=1 j/=10 until j<10 end if k%3==0 or k==0 then return j..' * 10^'..k else repeat k-=1 j*=10
until k%3==0 or k==0 return j..' * 10^'..k end elseif math.abs(j)<1 then if string.match(j,'^-')then repeat k+=1 j*=10
until j<=-1 else repeat k+=1 j*=10 until j>=1 end if k%3==0 or k==0 then return j..' * 10^'..-k else repeat k+=1 j*=10
until k%3==0 or k==0 return j..' * 10^'..k end end end function f.Random.Addition(i,j)if type(j)=='table'and j[4]then
else return warn'only tables are allowed in this function'end if j[5]then return warn"you can't have five table values"
end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k
,l,m,p=j[1],j[2],j[3],j[4]if p%1~=0 or p==0 then return warn'The total numbers have to be a whole number above 0'end if
l*p>=m then else return warn[[End Product has to be less than or equal to the max number possible]]end if k<=m/l then
else return warn[[Minimum has to be less than or equal to the min divider possible]]end if k>l then return warn
"min can't be greater than max"end local q={}if p%2==0 then local t=p/2 local u=m/t local v=(2-(u/l))*l for E=1,t,1 do
local F=u for G=1,2,1 do if G~=2 then local H=Random.new():NextNumber(l-v,l)table.insert(q,H)F-=H else table.insert(q,F)
F-=F end end end else if p~=1 then local t=Random.new():NextNumber(k,l)table.insert(q,t)local u=(p-1)/2 local v=(m-t)/u
local E=(2-(v/l))*l for F=1,u,1 do local G=v for H=1,2,1 do if H~=2 then local I=Random.new():NextNumber(l-E,l)table.
insert(q,I)G-=I else table.insert(q,G)G-=G end end end else table.insert(q,l)end end return q end function f.Random.
Multiplication(i,j)if type(j)=='table'and j[4]then else return warn'only tables are allowed in this function'end if j[5]
then return warn"you can't have five table values"end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end local k,l,m,p=j[1],j[2],j[3],j[4]if p%1~=0 or p==0 then return warn
'The total numbers have to be a whole number above 0'end if l^p>=m then else return warn
[[End Product has to be less than or equal to the max number possible]]end if k<=p*math.sqrt(l)then else return warn
[[Minimum has to be less than or equal to the min divider possible]]end if k>l then return warn
"min can't be greater than max"end local q={}local function t(u,v)local E=u for F=1,v-1,1 do E=math.sqrt(E)end return E
end if p%2==0 then local u=p/2 local v,E=t(m,u),m/l for F=1,u,1 do local G=v for H=1,2,1 do if H~=2 then local I=Random.
new():NextNumber(E,l)table.insert(q,I)G/=I else table.insert(q,G)G-=G end end end else if p~=1 then local u=Random.new()
:NextNumber(k,l)table.insert(q,u)local v=(p-1)/2 local E,F=t(m/u,v),(m/u)/l for G=1,v,1 do local H=E for I=1,2,1 do if I
~=2 then local K=Random.new():NextNumber(F,l)table.insert(q,K)H/=K else table.insert(q,H)H-=H end end end else table.
insert(q,l)end end return q end function f.Random.Integer(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end if j[3]then return warn"you can't have five table values"end for k=1,#j,1
do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k,l=j[1],j[2]if k>
l then return warn"min can't be greater than max"end return Random.new():NextInteger(k,l)end function f.Random.
NonInteger(i,j)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end if j[3]then
return warn"you can't have five table values"end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only numbers are allowed in the table'end end local k,l=j[1],j[2]if k>l then return warn"min can't be greater than max"
end return Random.new():NextNumber(k,l)end function f.Matrix.Multiplication(i,j)local k,l,m=j[1],j[2],j[3]if type(k)==
'table'and k[1]then else return warn'only tables are allowed in this function'end if type(l)=='table'and l[1]then else
return warn'only tables are allowed in this function'end if m then return warn
"you can't enter more then two tables into the function"end for p=1,#k,1 do if typeof(k[p])=='table'then for q=1,#k[p],1
do if typeof(k[p][q])=='number'then else return warn'only numbers are allowed in the table'end end else return warn
'only matrices are allowed in this function'end end for p=1,#l,1 do if typeof(l[p])=='table'then for q=1,#l[p],1 do if
typeof(l[p][q])=='number'then else return warn'only numbers are allowed in the table'end end else return warn
'only matrices are allowed in this function'end end if#k>#l then for p=1,#l,1 do if#l[p]~=#k then return warn
'inner matrix dimensions have to agree'end end elseif#k<#l or#k==#l then for p=1,#k,1 do if#k[p]~=#l then return warn
'inner matrix dimensions have to agree'end end end local p={}for q=1,#k,1 do p[q]={}for t=1,#l[1],1 do p[q][t]=0 for u=1
,#l,1 do p[q][t]=p[q][t]+k[q][u]*l[u][t]end end end return p end function f.Matrix.DotProduct(i,j)local k,l,m=j[1],j[2],
j[3]if type(k)=='table'then else return warn'only tables are allowed in this function'end if type(l)=='table'then else
return warn'only tables are allowed in this function'end if m then return warn"you can't have three tables"end if#k~=#l
then return warn'both tables need the same amount of values inside'end if#k==3 and#l==3 then else return warn
'both tables need 3 values each'end for p=1,#k,1 do if typeof(k[p])=='number'then else return warn
'only numbers are allowed in the table'end end for p=1,#l,1 do if typeof(l[p])=='number'then else return warn
'only numbers are allowed in the table'end end local p=0 for q=1,#k do p+=k[q]*l[q]end return p end function f.Matrix.
CrossProduct(i,j)local k,l,m=j[1],j[2],j[3]if type(k)=='table'then else return warn
'only tables are allowed in this function'end if type(l)=='table'then else return warn
'only tables are allowed in this function'end if m then return warn"you can't have three tables"end if#k~=#l then return
warn'both tables need the same amount of values inside'end if#k==3 and#l==3 then else return warn
'both tables need 3 values each'end for p=1,#k,1 do if typeof(k[p])=='number'then else return warn
'only numbers are allowed in the table'end end for p=1,#l,1 do if typeof(l[p])=='number'then else return warn
'only numbers are allowed in the table'end end local p,q,t=k[2]*l[3]-k[3]*l[2],k[3]*l[1]-k[1]*l[3],k[1]*l[2]-k[2]*l[1]
return{p,q,t}end function f.Matrix.TensorProduct(i,j)local k,l,m=j[1],j[2],j[3]if type(k)=='table'and k[1]then else
return warn'only tables are allowed in this function'end if type(l)=='table'and l[1]then else return warn
'only tables are allowed in this function'end if m then return warn
"you can't enter more then two tables into the function"end for p=1,#k,1 do if typeof(k[p])=='table'then for q=1,#k[p],1
do if typeof(k[p][q])=='number'then else return warn'only numbers are allowed in the table'end end else return warn
'only matrices are allowed in this function'end end for p=1,#l,1 do if typeof(l[p])=='table'then for q=1,#l[p],1 do if
typeof(l[p][q])=='number'then else return warn'only numbers are allowed in the table'end end else return warn
'only matrices are allowed in this function'end end local p={}for q=1,#k,1 do for t=1,#l,1 do local u={}for v=1,#k[q],1
do for E=1,#l[t],1 do table.insert(u,string.format('%3d ',k[q][v]*l[t][E]))end end table.insert(p,u)end end return p end
function f.Matrix.Transposition(i,j)if type(j)=='table'and j[1]then else return warn
'only tables are allowed in this function'end for k=1,#j,1 do if typeof(j[k])=='table'then for l=1,#j[k],1 do if typeof(
j[k][l])=='number'then else return warn'only numbers are allowed in the table'end end else return warn
'only matrices are allowed in this function'end end local k={}for l=1,#j[1],1 do k[l]={}for m=1,#j,1 do k[l][m]=j[m][l]
end end return k end function f.Matrix.ZigZag(i,j)if typeof(j)=='number'then else return warn'only numbers are allowed'
end if j%1==0 and j>=2 then else return warn"number has to be a whole number and can't be smaller than 2"end local k,l,m
={},0,0 for p=1,j do k[p]={}for q=1,j do k[p][q]=0 end end l=1 m=1 local p,q,t=0,0,0 while t<j*j do k[m][l]=t t=t+1 if l
==j then m+=1 k[m][l]=t t+=1 p=-1 q=1 end if m==1 then l+=1 k[m][l]=t t+=1 p=-1 q=1 end if m==j then l+=1 k[m][l]=t t+=1
p=1 q=-1 end if l==1 then m+=1 k[m][l]=t t+=1 p=1 q=-1 end l+=p m+=q end return k end function f.Special.Factorial(i,j)
if typeof(j)=='number'then else return warn'only numbers are allowed'end local function k(l)local m,p,q,t,u=f.Value:
EulersConstant(),f.Value:GammaCoeff(),f.Value:GammaQuad(),f.Value:GammaQui(),f.Value:GammaSet()local function v(E)return
E+m*E^2+p*E^3+q*E^4+t*E^5+u*E^6 end if l==1 then return 1 elseif math.abs(l)<=0.5 then return 1/v(l)else return(l-1)*k(l
-1)end end if math.abs(j)+j==0 and j~=0 then j*=-1 local l=k(j+1)l*=-1 return l else return k(j+1)end end function f.
Special.NthRoot(i,j)if type(j)=='table'and j[2]then else return warn'only tables are allowed in this function'end if j[3
]then return warn"you can't have three table values"end for k=1,#j,1 do if typeof(j[k])=='number'then else return warn
'only whole numbers are allowed in the table'end end local k,l,m=j[1],j[2],false if l%1~=0 then m=true end if math.abs(k
)+k==0 and k~=0 then local p=2 if m==true then p=-2 end if l%p==0 then return((-k)^(1/l))..'i'else return-((-k)^(1/l))
end end return k^(1/l)end function f.Special.PerNth(i,j)if type(j)=='table'and j[2]then else return warn
'only tables are allowed in this function'end if j[3]then return warn"you can't have three table values"end for k=1,#j,1
do if typeof(j[k])=='number'then else return warn'only numbers are allowed in the table'end end local k,l=j[1],j[2]local
m=k/l return m..' or '..(m*100)..'%'end return f end)()end,[68]=function()local b,c,d=a(68)local e return(function(...)
local f,g,h=d(c.Parent.Parent.utilities.randomString),d(c.Parent.Parent.utilities.customFunctions),d(c.Parent.Fusion)
local i,j=(h.Value)if g.getgenv then g.getgenv().data=g.getgenv().data or{}j=g.getgenv().data else _G.data=_G.data or{}j
=_G.data end local k={}type uid=string type tag=string function k.update(l:string,m:string,p:string)if m~='uid'and k.
find(l)and k.find(l)[m]then local q=k.find(l)q[m]:set(p)elseif not k.find(l)then error("couldn't find uid: "..l)elseif m
=='uid'or m=='tag'then error('cannot edit property '..m)elseif not k.find(l)[m]then error'index returned nil'else error
'how?'end end function k.find(l:uid|tag):table local m for p=1,#j do if j[p].uid==l or j[p].tag==l then m=j[p]end end if
not m then warn('no data found by identifier: '..tostring(l))return m end return m end function k.delete(l:string)local
m=k.find(l)local p,q=table.find(j,m),{}for t=1,#j do if t~=p then table.insert(q,j[t])end end j=q q=nil end function k.
add(l:table,m:string):table for p,q in l do l[p]=i(q)end l.tag=m or nil l.uid=f(16)setmetatable(l,{__index={update=
function(t,u,v)k.update(t.uid,u,v)end,delete=function()k.delete(l.uid)end}})table.insert(j,l)return k.find(l.uid)end
return k end)()end,[69]=function()local b,c,d=a(69)local e return(function(...)return{lock='rbxassetid://10723434711',
dropdown='rbxassetid://15555233897',chevron='rbxassetid://10709790948',emptyBox='rbxassetid://15555208034',filledBox=
'rbxassetid://15555206993',maximize='rbxassetid://15556636376',minimize='rbxassetid://15556637715',close=
'rbxassetid://10747384394'}end)()end,[70]=function()local b,c,d=a(70)local e return(function(...)local f=d(c.Parent.
Parent.utilities.customFunctions)local g,h=f.cloneref,{}h.UserInputService=g(game:GetService'UserInputService')h.
RunService=g(game:GetService'RunService')h.TextService=g(game:GetService'TextService')h.ContextActionService=g(game:
GetService'ContextActionService')return h end)()end,[71]=function()local b,c,d=a(71)local e return(function(...)local f,
g,h={},d(c.Parent.Fusion),d(c.default)local i,j,k,l,m,p=g.Value,g.Observer,d(c.Parent.Parent.utilities.get),d(c.Parent.
Parent.utilities.animate),d(c.Parent.Parent.preservedConfig),{}local q=i{}j(q):onChange(function()for t,u in ipairs(p)do
task.spawn(u)end end)local t={defaultTab='Color3',background='Color3',secondaryBackground='Color3',tertiaryBackground=
'Color3',text='Color3',image='Color3',placeholder='Color3',close='Color3'}function f.create(u)for v,E in t do if u[v]==
nil then u[v]=m[v]end if typeof(u[v])~='Color3'then error(v.." isn't type Color3")end end for F,G in u do if t[F]==nil
then warn('Incorrect value removed "'..tostring(F)..'"')u[F]=nil end end q:set(u)end function f.get(u:string,F:boolean)
local G=k(q)if G[u]then if F then return l(function()return k(q)[u]end,40,1)else return G[u]end else error(u..
" isn't a theme element")end end q:set(h)function f.onChange(u)table.insert(p,u)end return f end)()end,[72]=function()
local b,c,d=a(72)local e return(function(...)return{defaultTab=Color3.fromHex'#a49ae6',background=Color3.fromRGB(40,44,
50),secondaryBackground=Color3.fromRGB(49,56,66),tertiaryBackground=Color3.fromRGB(57,63,75),text=Color3.fromRGB(220,221
,225),image=Color3.fromRGB(220,221,225),placeholder=Color3.fromRGB(165,166,169),close=Color3.fromRGB(190,100,105)}end)()
end,[74]=function()local b,c,d=a(74)local e return(function(...)local f=c.Parent.Parent local g=d(f.Bundles.Fusion)local
h,i,j,k,l,m,p,q,t=g.New,g.OnEvent,g.Children,g.Value,g.Computed,d(f.utilities.get),d(f.Bundles.themeSystem),d(f.
utilities.animate),d(f.Bundles.icons)return function(u)assert(u.Name,':Button missing property Name')assert(typeof(u.
Name)=='string',('Name accepts type string got %s'):format(typeof(u.Name)))assert(u.Callback,
':Button missing property Callback')assert(typeof(u.Callback)=='function',('Callback accepts type function got %s'):
format(typeof(u.Callback)))local F,G,H,I,K,L=k(u.Name),k(u.Callback),u.tabColor or nil,k(false),k(false),k''local M,N=h
'TextButton'{Parent=u.Parent,ZIndex=2,Size=UDim2.new(1,0,0,40),AutoButtonColor=false,Interactable=l(function()return not
m(K)end),BackgroundColor3=q(function()return p.get'secondaryBackground'end,40,1),[i'MouseButton1Down']=function()I:set(
true)end,[i'MouseButton1Up']=function()I:set(false)end,[i'MouseLeave']=function()I:set(false)end,[i'Activated']=function
()task.spawn(m(G))end,[j]={h'UICorner'{CornerRadius=UDim.new(0,6)},{h'Frame'{ZIndex=3,Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.1,BackgroundColor3=q(function()return p.get'tertiaryBackground'end,40,1),Visible=l(function()
return m(K)end),[j]={h'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,
0.5),BackgroundTransparency=1,Image=t.lock,ImageColor3=q(function()return p.get'image'end,40,1)},h'TextLabel'{Text=l(
function()return m(L)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=
Enum.Font.GothamBold,BackgroundTransparency=1,TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,
TextColor3=q(function()return p.get'text'end,40,1),[j]={h'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},h
'UICorner'{CornerRadius=UDim.new(0,6)}}}},h'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),BackgroundColor3=q(function()return H or p.get'defaultTab'end,40,1),
BackgroundTransparency=q(function()if m(I)then return 0.95 end return 0.85 end,50,1),[j]={h'UICorner'{CornerRadius=UDim.
new(0,6)}}},h'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-20,0,14),AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
TextColor3=q(function()return p.get'text'end,40,1),Text=l(function()return m(F)end),TextTransparency=q(function()if m(I)
then return 0.35 end return 0 end,50,1),[j]={h'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}}},{}function N.
Remove(O)M:Destroy()end function N.SetName(O,P)if typeof(P)=='string'then F:set(P)else error('You didnt give '..m(F)..
' a string for SetName')end end function N.SetCallback(O,P)if typeof(P)=='function'then G:set(P)else error(
'You didnt give '..m(F)..' a function for SetCallback')end end function N.Lock(O,P)K:set(true)L:set(P or'Locked')end
function N.Unlock(O)K:set(false)end return N end end)()end,[75]=function()local b,c,d=a(75)local e return(function(...)
local f=c.Parent.Parent local g=d(f.Bundles.services)local h,i,j=g.UserInputService,g.RunService,d(f.Bundles.Fusion)
local k,l,m,p,q,t,u,F,G,H=j.New,j.OnEvent,j.Children,j.Value,j.Computed,j.Observer,d(f.utilities.get),d(f.Bundles.
themeSystem),d(f.utilities.animate),d(f.Bundles.icons)return function(I)assert(I.Name,
':ColorPicker missing property Name')assert(typeof(I.Name)=='string',('Name accepts type string got %s'):format(typeof(I
.Name)))assert(I.Callback,':ColorPicker missing property Callback')assert(typeof(I.Callback)=='function',(
'Callback accepts type function got %s'):format(typeof(I.Callback)))assert(I.Color,':ColorPicker missing property Color'
)assert(typeof(I.Color)=='Color3',('Color accepts type Color3 got %s'):format(typeof(I.Color)))local K,L,M,N,O,P=p(I.
Name),p(I.Color),p(I.Callback),I.tabColor or nil,p(false),p''local Q={u(L):ToHSV()}local R,S,T=p(Q[1]),p(Q[2]),p(Q[3])
local function U()return Color3.fromHSV(u(R),u(S),u(T))end local function V(...)local W,X,Y,Z={...}if typeof(W[1])==
'Color3'then X,Y,Z=W[1]:ToHSV()else X,Y,Z=Color3.new(...):ToHSV()end R:set(X)S:set(Y)T:set(Z)end local function W(X,Y)
local Z=1 for _=1,X do Z=Z*10 end return math.round(Y*Z)/Z end local X,Y,Z,_,aa,ab=p(false),p(false),(p(false))ab=k
'TextButton'{ClipsDescendants=true,Interactable=q(function()return not u(O)end),ZIndex=2,Parent=I.Parent,Size=G(function
()if u(X)then return UDim2.new(1,0,0,160)end return UDim2.new(1,0,0,40)end,50,1),BackgroundColor3=G(function()return F.
get'secondaryBackground'end,40,1),[l'Activated']=function()X:set(not u(X))end,[l'Destroying']=function()if _ then _:
Disconnect()end end,[m]={{{k'Frame'{ZIndex=4,Visible=q(function()return u(O)end),Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.1,BackgroundColor3=G(function()return F.get'tertiaryBackground'end,40,1),[m]={k'ImageLabel'{
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=G(function()return F.get'image'end,40,1),Image=H.lock},k'TextLabel'{Text=q(function()return u(P)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=G(function()return F.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[m]={k'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},k'UICorner'{CornerRadius=UDim.new(
0,6)}}}},k'UICorner'{CornerRadius=UDim.new(0,6)},k'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundColor3=G(function()return N or F.get'defaultTab'end,40,1),
BackgroundTransparency=0.85,[m]={k'UICorner'{CornerRadius=UDim.new(0,6)}}},k'TextLabel'{BackgroundTransparency=1,Size=
UDim2.new(1,-45,0,14),AnchorPoint=Vector2.new(0,0),Position=UDim2.new(0,10,0,13),Font=Enum.Font.Gotham,TextScaled=true,
TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,TextColor3=G(function()return F.get'text'end,40,1
),Text=u(K),[m]={k'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},k'ImageLabel'{ZIndex=3,AnchorPoint=Vector2.new(
1,0),Position=UDim2.new(1,-7,0,8),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image='rbxassetid://16898730641'
,ImageRectOffset=Vector2.new(257,257),ImageRectSize=Vector2.new(256,256),ImageColor3=q(function()return Color3.fromHSV(
u(R),u(S),u(T))end)}},k'Frame'{ClipsDescendants=true,Position=UDim2.fromOffset(10,40),Size=UDim2.new(1,-20,0,110),
BackgroundTransparency=1,ZIndex=3,[m]={k'UIListLayout'{Padding=UDim.new(0,10),SortOrder=Enum.SortOrder.LayoutOrder,
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.
VerticalAlignment.Center},k'TextBox'{Name='HexTextBox',Size=UDim2.fromOffset(145,110),BackgroundColor3=G(function()
return F.get'background'end,40,1),BackgroundTransparency=0.3,Text=q(function()return'#'..U():ToHex()end),TextColor3=G(
function()return U()end,40,1),TextSize=20,Font=Enum.Font.GothamMedium,[l'FocusLost']=function()local ac=ab:
FindFirstChild('HexTextBox',true).Text:gsub('[^%w#]','')if not string.find(ac,'#')then ac='#'..ac end if string.len(ac)
~=7 then warn('Hex code malformed',ac)ab:FindFirstChild('HexTextBox',true).Text='#'..U():ToHex()else local ad,ae=pcall(
function()return Color3.fromHex(ac)end)if tostring(ae)=='Unable to convert characters to hex value'then warn(
'Hex code malformed',ac)ab:FindFirstChild('HexTextBox',true).Text='#'..U():ToHex()else V(Color3.fromHex(ac))end end end,
[m]={k'UICorner'{CornerRadius=UDim.new(0,4)}}},k'Frame'{Name='HSVTextBoxes',Size=UDim2.fromOffset(55,110),
BackgroundColor3=G(function()return F.get'background'end,40,1),BackgroundTransparency=0.3,[m]={k'UICorner'{CornerRadius=
UDim.new(0,4)},k'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.
FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center},k'TextLabel'{Text='H',TextColor3=G(function(
)return N or F.get'defaultTab'end,40,1),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14
)},k'TextBox'{Name='HText',TextColor3=G(function()return F.get'text'end,40,1),Font=Enum.Font.Gotham,
BackgroundTransparency=1,Text=q(function()return tostring(W(2,u(R)))end),Size=UDim2.fromOffset(55,14),[l'Changed']=
function(ac)local ad=tonumber(ab:FindFirstChild('HText',true).Text)if ac:lower()=='text'then if ad then ad=math.clamp(ad
,0,1)if W(2,u(R))~=ad then R:set(ad)end end ab:FindFirstChild('HText',true).Text=tostring(W(2,u(R)))end end},k
'TextLabel'{Text='S',TextColor3=G(function()return N or F.get'defaultTab'end,40,1),Font=Enum.Font.GothamMedium,
BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},k'TextBox'{Name='SText',TextColor3=G(function()return F.get'text'
end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=q(function()return tostring(W(2,u(S)))end),Size=UDim2.
fromOffset(55,14),[l'Changed']=function(ac)local ad=tonumber(ab:FindFirstChild('SText',true).Text)if ac:lower()=='text'
then if ad then ad=math.clamp(ad,0,1)if W(2,u(S))~=ad then S:set(ad)end end ab:FindFirstChild('SText',true).Text=
tostring(W(2,u(S)))end end},k'TextLabel'{Text='V',TextColor3=G(function()return N or F.get'defaultTab'end,40,1),Font=
Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},k'TextBox'{Name='VText',TextColor3=G(
function()return F.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=q(function()return tostring(W(
2,u(T)))end),Size=UDim2.fromOffset(55,14),[l'Changed']=function(ac)local ad=tonumber(ab:FindFirstChild('VText',true).
Text)if ac:lower()=='text'then if ad then ad=math.clamp(ad,0,1)if W(2,u(T))~=ad then T:set(ad)end end ab:FindFirstChild(
'VText',true).Text=tostring(W(2,u(T)))end end}}},k'Frame'{Name='RGBTextBoxes',Size=UDim2.fromOffset(55,110),
BackgroundColor3=G(function()return F.get'background'end,40,1),BackgroundTransparency=0.3,[m]={k'UICorner'{CornerRadius=
UDim.new(0,4)},k'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.
FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center},k'TextLabel'{Text='R',TextColor3=Color3.
fromRGB(200,0,0),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},k'TextBox'{Name=
'RText',TextColor3=G(function()return F.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=q(
function()return tostring(math.round(U().R*255))end),Size=UDim2.fromOffset(55,14),[l'FocusLost']=function()local ac,ad=
tonumber(ab:FindFirstChild('RText',true).Text),U()if ac then if math.clamp(math.round(ad.R*255),0,255)~=ac then V(math.
clamp(ac,0,255)/255,ad.G,ad.B)end else ab:FindFirstChild('RText',true).Text=tostring(math.round(ad.R*255))end end},k
'TextLabel'{Text='G',TextColor3=Color3.fromRGB(0,200,0),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.
fromOffset(55,14)},k'TextBox'{Name='GText',TextColor3=G(function()return F.get'text'end,40,1),Font=Enum.Font.Gotham,
BackgroundTransparency=1,Text=q(function()return tostring(math.round(U().G*255))end),Size=UDim2.fromOffset(55,14),[l
'FocusLost']=function()local ac,ad=tonumber(ab:FindFirstChild('GText',true).Text),U()if ac then if math.clamp(math.
round(ad.G*255),0,255)~=ac then V(ad.R,math.clamp(ac,0,255)/255,ad.B)end else ab:FindFirstChild('GText',true).Text=
tostring(math.round(ad.G*255))end end},k'TextLabel'{Text='B',TextColor3=Color3.fromRGB(0,0,125),Font=Enum.Font.
GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},k'TextBox'{Name='BText',TextColor3=G(function()
return F.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=q(function()return tostring(math.round(
U().B*255))end),Size=UDim2.fromOffset(55,14),[l'FocusLost']=function()local ac,ad=tonumber(ab:FindFirstChild('BText',
true).Text),U()if ac then if math.clamp(math.round(ad.B*255),0,255)~=ac then V(ad.R,ad.G,math.clamp(ac,0,255)/255)end
else print'B needs to be a number'ab:FindFirstChild('BText',true).Text=tostring(math.round(ad.B*255))end end}}},k
'TextButton'{ZIndex=2,Name='SVPicker',ClipsDescendants=true,Size=UDim2.fromOffset(110,110),[l'InputBegan']=function(ac)
if ac.UserInputType==Enum.UserInputType.MouseButton1 or ac.UserInputType==Enum.UserInputType.Touch then Y:set(true)local
ad ad=ac.Changed:Connect(function()if ac.UserInputState==Enum.UserInputState.End then Y:set(false)ad:Disconnect()end end
)end end,[m]={k'UIGradient'{Color=q(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,
255,255)),ColorSequenceKeypoint.new(1,Color3.fromHSV(u(R),1,1))}end)},k'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0),Size=UDim2.fromScale(1,2),BackgroundTransparency=1,Image='rbxassetid://13611892279'},k
'Frame'{ZIndex=2,Name='dot',AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=q(function()local ac if u(R)>0.95 or u(R)
<=0.05 then ac=0.5 elseif u(R)<0.56 and u(R)>0.45 then ac=1 else if u(R)+1>1 then ac=1-u(R)else ac=1+u(R)end end return
Color3.fromHSV(ac,1,1)end),Size=UDim2.fromOffset(4,4),Position=q(function()return UDim2.fromScale(u(S),1-u(T))end)}}},k
'TextButton'{ZIndex=2,Name='HPicker',Size=UDim2.fromOffset(55,110),[l'InputBegan']=function(ac)if ac.UserInputType==Enum
.UserInputType.MouseButton1 or ac.UserInputType==Enum.UserInputType.Touch then Z:set(true)local ad ad=ac.Changed:
Connect(function()if ac.UserInputState==Enum.UserInputState.End then Z:set(false)ad:Disconnect()end end)end end,[m]={k
'UIGradient'{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromHSV(1,1,1)),
ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8,1,1)),
ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},k'Frame'{
Name='slide',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,0,0,2),Position=q(function()return UDim2.fromScale(0,1-u(R)
)end)}}}}}}}t(Y):onChange(function()if u(Y)then _=i.Heartbeat:Connect(function()local ac=(h:GetMouseLocation()-ab:
FindFirstChild('SVPicker',true).AbsolutePosition)ac=Vector2.new(math.clamp(ac.X,0,110),math.clamp(ac.Y,0,110))S:set(ac.X
/110)T:set((110-ac.Y)/110)end)else if _ then _:Disconnect()end end end)t(Z):onChange(function()if u(Z)then aa=i.
Heartbeat:Connect(function()local ac=(h:GetMouseLocation()-ab:FindFirstChild('HPicker',true).AbsolutePosition)ac=Vector2
.new(ac.X,math.clamp(ac.Y,0,110))R:set((110-ac.Y)/110)end)else if aa then aa:Disconnect()end end end)t(R):onChange(
function()task.spawn(u(M),U())end)t(S):onChange(function()task.spawn(u(M),U())end)t(T):onChange(function()task.spawn(u(M
),U())end)local ac={}function ac.Lock(ad,ae)O:set(true)X:set(false)P:set(ae or'Locked')end function ac.Unlock(ad)O:set(
false)end function ac.Remove(ad)ab:Destroy()end function ac.SetColor(ad,ae)V(ae)end return ac end end)()end,[76]=
function()local aa,ab,ac=a(76)local ad return(function(...)local ae=ab.Parent.Parent local b=ac(ae.Bundles.Fusion)local
c,d,e,f,g,h,i,j,k,l,m,p=b.New,b.OnEvent,b.Children,b.Value,b.Computed,b.Ref,b.Observer,ac(ae.utilities.get),ac(ae.
Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.Bundles.icons),ac(ae.Bundles.betterMathModule)return function(q)
assert(q.Name,':Dropdown missing property Name')assert(typeof(q.Name)=='string',('Name accepts type string got %s'):
format(typeof(q.Name)))assert(q.Callback,':Dropdown missing property Callback')assert(typeof(q.Callback)=='function',(
'Callback accepts type function got %s'):format(typeof(q.Callback)))assert(q.Items,':Dropdown missing property Items')
assert(typeof(q.Items)=='table',('Callback accepts type table got %s'):format(typeof(q.Items)))if q.Multiselect then
assert(typeof(q.Multiselect)=='boolean',('Multiselect accepts type boolean got %s'):format(typeof(q.Multiselect)))end if
q.Default then assert((typeof(q.Default)=='string'or typeof(q.Default)=='table'),(
'Default accepts type string or table got %s'):format(typeof(q.Default)))end local t,u,F,G,H,I,K,L=f(q.Default),f(q.Name
),f(q.Items),f(q.Callback),f(q.Multiselect or false),q.tabColor or nil,f{},{}local M,N,O,P,Q,R,S,T,U,V,W,X=f(j(u)),f(0),
f'',f(),f(),f(false),f(false),f'',{},f(false),f'',f(false)local af=c'Frame'{ClipsDescendants=true,Parent=q.Parent,Name=
j(M),BackgroundColor3=l(function()return k.get'secondaryBackground'end,40,1),Size=l(function()if j(S)then return UDim2.
new(1,0,0,174)end return UDim2.new(1,0,0,40)end,50,1),[e]={{c'UICorner'{CornerRadius=UDim.new(0,6)},c'Frame'{ZIndex=2,
Size=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.fromScale(0.5,0),BackgroundColor3=l(function()
return I or k.get'defaultTab'end,40,1),BackgroundTransparency=l(function()if j(R)then return 0.95 end return 0.85 end,50
,1),[e]={c'UICorner'{CornerRadius=UDim.new(0,6)}}},c'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-45,0,14),
AnchorPoint=Vector2.new(0,0),Position=UDim2.new(0,10,0,13),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Text=g(function()return j(u)end),TextColor3=l(function()return k.get'text'end,40
,1),TextTransparency=l(function()if j(R)then return 0.35 end return 0 end,50,1),[e]={c'UITextSizeConstraint'{MinTextSize
=1,MaxTextSize=14}}},c'ImageLabel'{Name='icon',AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-5,0,6),Size=UDim2.
fromOffset(28,28),BackgroundTransparency=1,Image=m.dropdown,ImageColor3=l(function()return k.get'image'end,40,1),
ImageTransparency=l(function()if j(R)then return 0.35 end return 0 end,50,1)},{c'Frame'{ZIndex=3,Visible=g(function()
return j(V)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,BackgroundColor3=l(function()return k.get
'tertiaryBackground'end,40,1),[e]={c'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=
UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=l(function()return k.get'image'end,40,1),Image=m.lock},c
'TextLabel'{Text=g(function()return j(W)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.
new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=l(function()return k.get'text'end,40,1),
TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[e]={c'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}},c'UICorner'{CornerRadius=UDim.new(0,6)}}}}},c'TextButton'{Interactable=g(function()return not j(V)end)
,Size=UDim2.new(1,0,0,40),BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0),Position=UDim2.fromScale(0.5,0),[d
'MouseButton1Down']=function()R:set(true)end,[d'MouseButton1Up']=function()R:set(false)end,[d'MouseLeave']=function()R:
set(false)end,[d'Activated']=function()S:set(not j(S))end},c'TextBox'{Name='searchBox',Size=UDim2.new(1,-16,0,28),
Position=UDim2.new(0.5,0,0,40),Text='',AnchorPoint=Vector2.new(0.5,0),PlaceholderText='Search',Font=Enum.Font.
GothamMedium,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,BackgroundColor3=l(function()return I or k.get
'defaultTab'end,40,1),TextColor3=l(function()return k.get'text'end,40,1),PlaceholderColor3=l(function()return k.get
'placeholder'end,40,1),BackgroundTransparency=l(function()if j(R)then return 0.95 end return 0.8 end,50,1),
TextTransparency=l(function()if j(R)then return 0.35 end return 0 end,50,1),[d'Changed']=function(Y)if Y=='Text'then
local Z,_=j(Q),j(P)T:set(string.lower(Z.Text))if j(T)~=''then for af,ag in ipairs(_:GetChildren())do if j(T)==''then
break end if ag:IsA'TextButton'then local ah=p.String:JaroWinklerDistance{j(T),ag.Name}if ah<0.45 then ag.Visible=true
else ag.Visible=false end end task.wait()end else for af,ag in ipairs(_:GetChildren())do if ag:IsA'TextButton'then ag.
Visible=true end end end end end,[h]=Q,[e]={{c'UICorner'{CornerRadius=UDim.new(0,4)},c'UIPadding'{PaddingLeft=UDim.new(0
,10)}}}},c'ScrollingFrame'{Name='Items',Size=UDim2.new(1,0,0,94),BackgroundTransparency=1,ScrollBarThickness=2,Position=
UDim2.new(0.5,0,0,72),AnchorPoint=Vector2.new(0.5,0),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.
AutomaticSize.Y,ScrollBarImageColor3=l(function()return I or k.get'defaultTab'end,40,1),[h]=P,[e]={c'UIListLayout'{
Padding=UDim.new(0,2),HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder}}}}}i(K):
onChange(function()local ag={}u:set(j(M))N:set(0)for ah,Y in ipairs(j(K))do local Z,_=f(false),f(false)i(_):onChange(
function()if j(H)then if j(_)then N:set(j(N)+1)else N:set(j(N)-1)end u:set(j(M)..': '..tostring(j(N))..'/'..tostring(#j(
F)))else u:set(j(M)..': '..j(O))end end)i(O):onChange(function()if not j(H)then if j(O)==Y then _:set(true)else _:set(
false)end end end)local ai=c'TextButton'{Size=UDim2.new(0.95,0,0,30),Name=Y,Parent=j(P),BackgroundColor3=l(function()
return k.get'text'end,40,1),BackgroundTransparency=l(function()if j(Z)then return 0.95 end return 1 end,50,1),[d
'MouseEnter']=function()Z:set(true)end,[d'MouseLeave']=function()Z:set(false)end,[d'Activated']=function()if j(H)then if
j(_)then _:set(false)table.remove(L,table.find(L,Y))else _:set(true)table.insert(L,Y)end task.spawn(j(G),L)else S:set(
false)O:set(Y)task.spawn(j(G),j(O))end end,[e]={c'UICorner'{CornerRadius=UDim.new(0,6)},c'TextLabel'{Size=UDim2.new(1,0,
0,12),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Font=Enum.Font.Gotham,
TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Text=Y,TextColor3=l(function()if j(H)then if j(_)and not j(Z)then
return Color3.fromRGB(85,220,135)elseif j(_)and j(Z)then return Color3.fromRGB(190,100,105)else return k.get'text'end
end return k.get'text'end,30,1),TextTransparency=l(function()if j(R)then return 0.35 end return 0 end,50,1),[e]={c
'UIPadding'{PaddingLeft=UDim.new(0,20)}}}}}if typeof(j(t))=='table'and j(H)then for aj,ak in ipairs(j(t))do if ak==Y
then _:set(true)table.insert(L,Y)end end elseif typeof(j(t))=='string'then if j(t)==Y then if j(H)then _:set(true)table.
insert(L,Y)else O:set(j(t))task.spawn(j(G),j(O))end end end U[Y]=function(aj)_:set(aj)end end if j(H)and#L>0 then task.
spawn(j(G),L)end end)K:set(j(F))local ag={}function ag.Remove(ah)af:Destroy()end function ag.SetItems(ah,ai)if typeof(ai
)=='table'then K:set(ai)else error("You didn't give "..j(M)..' a table for SetItems')end end function ag.SelectItem(ah,
ai)if not j(H)then if typeof(ai)=='string'then local aj=false for ak,Y in ipairs(j(K))do if Y==ai then aj=true end end
if aj then O:set(ai)for Z,_ in ipairs(U)do _(false)end U[ai](true)task.spawn(j(G),j(O))else error(ai..
" isn't in your Item table")end else error('You tried to pass a '..typeof(ai)..' as a string for SelectItem')end else
error(j(M)..' is multiselectable. Use SelectItems')end end function ag.SelectItems(ah,ai)if j(H)then if typeof(ai)==
'table'then local aj={}for ak,Y in ipairs(ai)do if table.find(j(K),Y)then table.insert(aj,Y)else warn(Y..
" isn't in the Items table")end end task.wait()for Z,_ in ipairs(aj)do U[_](true)end task.spawn(j(G),aj)L=aj else error(
'You tried to pass a '..typeof(ai)..' as a table for SelectItems')end else error(j(M)..
" isn't multiselectable. Use SelectItems")end end function ag.Lock(ah,ai)V:set(true)X:set(j(S))W:set(ai or'Locked')S:
set(false)end function ag.Unlock(ah)V:set(false)S:set(j(X))end return ag end end)()end,[77]=function()local aa,ab,ac=a(
77)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b,c,d,e,f=af.
New,af.OnEvent,af.Children,af.Value,af.Computed,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate)
,ac(ae.Bundles.icons)return function(g)assert(g.Name,':Group missing property Name')assert(typeof(g.Name)=='string',(
'Name accepts type string got %s'):format(typeof(g.Name)))if g.Icon then assert(typeof(g.Icon)=='string',(
'Icon accepts type string got %s'):format(typeof(g.Icon)))end local h,i,j,k,l,m,p,q,t=aj(g.Name),aj(g.Icon or''),g.
tabColor or nil,aj(40),aj(false),aj(false),aj(false),aj'',aj(false)local u=ag'TextButton'{ZIndex=2,Parent=g.Parent,
ClipsDescendants=true,Size=b(function()if c(l)then return UDim2.new(1,0,0,40)end return UDim2.new(1,0,0,c(k))end),
BackgroundTransparency=e(function()if c(l)then return 0 end return 1 end,30,1),BackgroundColor3=e(function()if c(l)then
return d.get'secondaryBackground'end return d.get'background'end,30,1),[ah'Activated']=function()l:set(not c(l))end,[ai]
={{ag'Frame'{ZIndex=3,Name='Lock',Visible=b(function()return c(m)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=
0.1,BackgroundColor3=e(function()return d.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(
0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=e(function()return
d.get'image'end,40,1),Image=f.lock},ag'TextLabel'{Text=b(function()return c(q)end),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=
e(function()return d.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'UICorner'{
CornerRadius=UDim.new(0,4)},ag'TextLabel'{Text=b(function()return c(h)end),TextColor3=e(function()if c(l)then return d.
get'text'end return j or d.get'defaultTab'end,40,1),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,Size=b(function
()if c(t)then return UDim2.new(1,-54,0,16)end return UDim2.new(1,-20,0,16)end),TextSize=16,Position=b(function()if c(t)
then return UDim2.fromOffset(44,12)end return UDim2.fromOffset(10,12)end),AnchorPoint=Vector2.new(0,0),TextXAlignment=
Enum.TextXAlignment.Left},ag'ImageLabel'{Visible=b(function()if c(t)then return true end return false end),
BackgroundTransparency=1,ImageColor3=e(function()return d.get'image'end,40,1),Image=b(function()if c(t)then return c(i)
end return''end),Size=UDim2.fromOffset(24,24),Position=UDim2.fromOffset(10,8)},ag'Frame'{BackgroundTransparency=1,Size=
UDim2.fromOffset(24,24),Position=UDim2.new(1,-34,0,8),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),ImageColor3=e(function()if c(l)then
return d.get'image'end return j or d.get'defaultTab'end,40,1),Image=f.chevron,Rotation=e(function()if c(l)then return 0
end return 180 end,30,1)}}},ag'Frame'{Name='componentHolder',Size=b(function()return UDim2.new(1,0,0,c(k)-40)end),
Position=UDim2.fromOffset(0,40),BackgroundTransparency=1,[ah'ChildAdded']=function(u)if typeof(u)=='Instance'and not u:
IsA'UIListLayout'then local F=u.AbsoluteSize.Y k:set(c(k)+u.AbsoluteSize.Y+5)u.Changed:Connect(function(G)if G:lower()==
'absolutesize'then if F~=math.round(u.AbsoluteSize.Y)then k:set(c(k)-F+math.round(u.AbsoluteSize.Y))F=math.round(u.
AbsoluteSize.Y)end end end)end end,[ai]={ag'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,
FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.
VerticalAlignment.Top},ag'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,5)}}}}}if c(i)~=''then t:set(true
)end local F={}function F.SetName(G,H)if typeof(H)=='string'then h:set(H)else error('You entered a '..typeof(H)..
' instead of a string')end end function F.SetIcon(G,H)if typeof(H)=='string'then i:set(H)else error('You entered a '..
typeof(H)..' instead of a string')end end function F.Lock(G,H)m:set(true)p:set(c(l))l:set(true)q:set(H or'Locked')end
function F.Unlock(G)m:set(false)l:set(c(p))end return u.componentHolder,F end end)()end,[78]=function()local aa,ab,ac=a(
78)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.services)local ag,ah=af.
UserInputService,ac(ae.Bundles.Fusion)local ai,aj,b,c,d,e,f,g,h,i,j=ah.New,ah.OnEvent,ah.Children,ah.Value,ah.Computed,
ah.Ref,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.Bundles.icons),ac(ae.utilities.
connections)return function(k)assert(k.Name,':Keybind missing property Name')assert(typeof(k.Name)=='string',(
'Name accepts type string got %s'):format(typeof(k.Name)))assert(k.Callback,':Keybind missing property Callback')assert(
typeof(k.Callback)=='function',('Callback accepts type function got %s'):format(typeof(k.Callback)))assert(k.Default,
':Keybind missing property Default')assert(typeof(k.Default)=='string',('Default accepts type string got %s'):format(
typeof(k.Default)))local l,m,p,q,t,u,F,G,H=c(k.Name),c(k.Callback),c(string.upper(k.Default)),k.tabColor or nil,c(),c(
false),c(false),c'',{}local I=ai'TextButton'{Interactable=d(function()return not f(F)end),Size=UDim2.new(1,0,0,40),
BackgroundColor3=h(function()return g.get'secondaryBackground'end,40,1),Parent=k.Parent,[aj'MouseButton1Click']=function
()local I=f(t)I:CaptureFocus()end,[b]={{{ai'Frame'{ZIndex=4,Visible=d(function()return f(F)end),Size=UDim2.fromScale(1,1
),BackgroundTransparency=0.1,BackgroundColor3=h(function()return g.get'tertiaryBackground'end,40,1),[b]={ai'ImageLabel'{
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=h(function()return g.get'image'end,40,1),Image=i.lock},ai'TextLabel'{Text=d(function()return f(G)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=h(function()return g.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[b]={ai'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ai'UICorner'{CornerRadius=UDim.
new(0,6)}}}},ai'UICorner'{CornerRadius=UDim.new(0,6)},ai'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=0.85,BackgroundColor3=h(function()return q or g.get
'defaultTab'end,40,1),[b]={ai'UICorner'{CornerRadius=UDim.new(0,6)}}},ai'TextLabel'{BackgroundTransparency=1,Size=UDim2.
new(1,-60,0,14),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,
TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,Text=f(l),TextColor3=h(function()return g.get
'text'end,40,1),[b]={ai'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ai'Frame'{ZIndex=3,Size=UDim2.new(0,30,0,
24),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=0.25,BackgroundColor3=h(
function()return g.get'secondaryBackground'end,40,1),[b]={ai'UICorner'{CornerRadius=UDim.new(0,6)}}}},ai'TextBox'{
Interactable=d(function()return not f(F)end),ZIndex=3,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),
Size=UDim2.new(0,30,0,12),BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,PlaceholderText='. . .',
Font=Enum.Font.Gotham,TextSize=12,PlaceholderColor3=h(function()return g.get'placeholder'end,40,1),TextColor3=h(function
()if f(u)then return g.get'text'end return q or g.get'defaultTab'end,50,1),Text=d(function()return f(p)end),[aj'Focused'
]=function()u:set(true)p:set''end,[aj'FocusLost']=function()u:set(false)end,[e]=t}}}local K=ag.InputBegan:Connect(
function(K,L)if f(u)then if K.KeyCode~=Enum.KeyCode.Unknown then local M=string.split(tostring(K.KeyCode),'.')p:set(M[3]
)f(t):ReleaseFocus()end elseif not L and(f(p)~='')and(K.KeyCode==Enum.KeyCode[f(p)])and I then if not f(F)then task.
spawn(f(m))end end end)j.add(K)function H.Remove(L)I:Destroy()K:Disconnect()end function H.SetBind(L,M:string)if typeof(
M)=='string'then p:set(string.upper(M))else error('you didnt give '..f(l)..' a string for SetBind!')end end function H.
Lock(L,M)F:set(true)G:set(M or'Locked')end function H.Unlock(L)F:set(false)end return H end end)()end,[79]=function()
local aa,ab,ac=a(79)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,
aj,b,c,d,e=af.New,af.Children,af.Value,af.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),ac(ae.Bundles.
themeSystem),ac(ae.utilities.lerpColor)return function(f)assert(f.Text,'Label just put a string')assert(typeof(f.Text)==
'string','Label needs to literally be a string')local g,h=ai(f.Text),f.tabColor or nil local i,j=ag'Frame'{Size=UDim2.
new(1,0,0,30),Parent=f.Parent,BackgroundColor3=c(function()return d.get'secondaryBackground'end,40,1),[ah]={ag'UICorner'
{CornerRadius=UDim.new(0,4)},ag'TextLabel'{ZIndex=2,Font=Enum.Font.GothamMedium,TextSize=14,RichText=true,TextScaled=
true,BackgroundTransparency=1,Size=UDim2.new(1,-20,0,14),Position=UDim2.new(0,10,0.5,0),AnchorPoint=Vector2.new(0,0.5),
TextXAlignment=Enum.TextXAlignment.Left,TextColor3=c(function()return e(h or d.get'defaultTab','white',0.5)end,40,1),
Text=aj(function()return b(g)end),[ah]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}}},{}function j.Remove(k
)i:Destroy()end function j.SetText(k,l)if typeof(l)=='string'then g:set(l)else error('you didnt give '..b(g)..
' a string for SetText!')end end return j end end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)
local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b,c,d,e,f,g=af.New,af.OnEvent,af.Children,af.
Value,af.Computed,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.tween),ac(ae.
utilities.getStringBounds)local function h(i,j)local k=1 for l=1,i do k=k*10 end local l=tostring(math.round(j*k)/k)
local m=string.split(l,'.')if#m==1 then local p=''for q=1,i do p=p..'0'end l=l..'.'..p end return l end return function(
i)assert(i.Title,'Notify needs a Title')assert(typeof(i.Title)=='string',('Title accepts type string got %s'):format(
typeof(i.Title)))assert(i.Body,'Notfiy needs a Body')assert(typeof(i.Body)=='string',('Body accepts type string got %s')
:format(typeof(i.Body)))assert(i.Duration,'Notify needs a Duration')assert(typeof(i.Duration)=='number',(
'Duration accepts type number got %s'):format(typeof(i.Duration)))local j,k,l,m,p,q,t,u,F=aj(i.Parent),aj(i.Title),aj(i.
Body),aj(i.Duration),aj(g(i.Body,{TextSize=13,Font=Enum.Font.Gotham,VectorSize=Vector2.new(230,1000)}).Y),aj(false),aj(
false),(aj'')F=ag'Frame'{AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Parent=c(j),Size=e(function()if c(q)
then task.delay(0.4,function()t:set(true)end)return UDim2.fromOffset(230,25+c(p)+15)end return UDim2.fromOffset(230,0)
end,20,1),[ai]={ag'TextButton'{AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=0,BackgroundColor3=e(function()
return d.get'background'end,40,1),Size=b(function()return UDim2.fromOffset(230,25+c(p)+15)end),Position=e(function()if
c(t)then return UDim2.fromScale(0,0.5)end return UDim2.fromScale(1.2,0.5)end,30,1),[ah'Activated']=function()t:set(false
)task.wait(0.4)q:set(false)task.wait(2)F:Destroy()end,[ai]={ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'TextLabel'{Name=
'Title',Size=UDim2.new(1,-5,0,18),Position=UDim2.new(0,5,0,5),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,
TextXAlignment=Enum.TextXAlignment.Left,TextSize=18,TextColor3=e(function()return d.get'text'end,40,1),Text=c(k)},ag
'TextLabel'{Name='Body',Size=UDim2.new(1,-8,0,c(p)),Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,Font=Enum.
Font.Gotham,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextTransparency=
0.2,TextWrapped=true,TextColor3=e(function()return d.get'text'end,40,1),Text=c(l)},ag'TextLabel'{Size=UDim2.fromOffset(
100,10),AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-5,1,-5),Text=b(function()return c(u)end),TextColor3=e(
function()return d.get'text'end,40,1),BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right},ag'Frame'{Name=
'timer',ZIndex=0,AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0,1),BackgroundColor3=e(function()return d.get
'text'end,40,1),Size=f(function()if c(t)then return UDim2.new(1,0,0,10)end return UDim2.new(0,0,0,10)end,TweenInfo.new(
c(m),Enum.EasingStyle.Linear)),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'Frame'{AnchorPoint=Vector2.new(0.5,0),
Size=UDim2.fromScale(1,0.6),Position=UDim2.fromScale(0.5,0),BackgroundColor3=e(function()return d.get'background'end,40,
1)}}}}}}}task.spawn(function()repeat task.wait()until c(t)local G,H=(tick())repeat H=tick()-G u:set(h(1,math.clamp(H,0,
c(m))))task.wait()until H>c(m)end)task.spawn(function()task.wait()q:set(true)repeat task.wait()until c(t)task.wait(c(m))
t:set(false)task.wait(0.4)q:set(false)task.wait(2)F:Destroy()end)end end)()end,[81]=function()local aa,ab,ac=a(81)local
ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b,c,d,e,f,g=af.New,af.
Children,af.Value,af.Computed,af.Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae
.utilities.getStringBounds),ac(ae.utilities.lerpColor)return function(h)assert(h.Title,
':Paragraph missing property Title')assert(typeof(h.Title)=='string',('Title accepts type string got %s'):format(typeof(
h.Title)))assert(h.Body,':Paragraph missing property Body')assert(typeof(h.Body)=='string',(
'Body accepts type string got %s'):format(typeof(h.Body)))local i,j=ai(h.Title),ai(h.Body)local k=ai(f(c(j),{Font=Enum.
Font.Gotham,VectorSize=Vector2.new(math.round(h.Parent.AbsoluteSize.X),1000),TextSize=12}).Y)h.Parent.Changed:Connect(
function(l)if l:lower()=='absolutesize'then k:set(f(c(j),{Font=Enum.Font.Gotham,VectorSize=Vector2.new(math.round(h.
Parent.AbsoluteSize.X),1000),TextSize=12}).Y)end end)b(j):onChange(function()k:set(f(c(j),{Font=Enum.Font.Gotham,
VectorSize=Vector2.new(math.round(h.Parent.AbsoluteSize.X),1000),TextSize=12}).Y)end)local l,m=ag'Frame'{
BackgroundColor3=e(function()return d.get'secondaryBackground'end,40,1),Parent=h.Parent,Size=aj(function()return UDim2.
new(1,0,0,36+c(k))end),[ah]={ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'UIPadding'{PaddingTop=UDim.new(0,10),
PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10)},ag'TextLabel'{Name='Title',RichText=true,Position=UDim2.
fromScale(0,0),Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextScaled=true,TextSize=16,Font=Enum.Font.GothamMedium,TextColor3=e(function()return d.get
'text'end,40,1),Text=aj(function()return c(i)end),[ah]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag
'TextLabel'{Name='Body',TextWrapped=true,RichText=true,Position=UDim2.fromOffset(4,16),BackgroundTransparency=1,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextSize=12,Font=Enum.Font.Gotham,
TextColor3=e(function()return g(d.get'text','black',0.1)end,40,1),Text=aj(function()return c(j)end),Size=aj(function()
return UDim2.new(1,-4,0,c(k))end)}}},{}function m.Remove(p)l:Destroy()end function m.SetBody(p,q)if typeof(q)=='string'
then j:set(q)else error('you didnt give '..c(i)..' a string for SetBody!')end end function m.SetTitle(p,q)if typeof(q)==
'string'then i:set(q)else error('you didnt give '..c(i)..' a string for SetTitle!')end end return m end end)()end,[82]=
function()local aa,ab,ac=a(82)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local
ag,ah,ai,aj,b,c,d=af.New,af.Children,af.Value,af.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),ac(ae.Bundles.
themeSystem)return function(e)assert(e.Text,'Section just put a string')assert(typeof(e.Text)=='string',
'Section needs to literally be a string')local f,g=ai(e.Text),{}local h=ag'Frame'{Size=UDim2.new(1,0,0,30),
BackgroundTransparency=1,Parent=e.Parent,[ah]={ag'TextLabel'{Size=UDim2.new(1,0,0,15),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,TextScaled=true,Font=Enum.Font.GothamMedium,TextXAlignment=Enum.
TextXAlignment.Left,TextColor3=c(function()return d.get'text'end,40,1),Text=aj(function()return b(f)end),[ah]={ag
'UITextSizeConstraint'{MaxTextSize=15,MinTextSize=1}}}}}function g.Remove(i)h:Destroy()end function g.SetText(i,j)if
typeof(j)=='string'then f:set(j)else error('you didnt give '..b(f)..' a string for SetText!')end end return g end end)()
end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.
services)local ag,ah,ai=af.RunService,af.UserInputService,ac(ae.Bundles.Fusion)local aj,b,c,d,e,f,g,h,i,j,k=ai.New,ai.
OnEvent,ai.Children,ai.Value,ai.Computed,ai.Ref,ai.Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.
utilities.animate),ac(ae.Bundles.icons)return function(l)assert(l.Name,':Slider needs a Name')assert(typeof(l.Name)==
'string',('Name accepts type string got %s'):format(typeof(l.Name)))assert(l.Max,':Slider needs a Max')assert(typeof(l.
Max)=='number',('Max accepts type number got %s'):format(typeof(l.Max)))assert(l.Min,':Slider needs a Min')assert(
typeof(l.Min)=='number',('Min accepts type number got %s'):format(typeof(l.Min)))assert(l.Callback,
':Slider needs a Callback')assert(typeof(l.Callback)=='function',('Callback accepts type function got %s'):format(
typeof(l.Callback)))if l.Placement then assert(typeof(l.Placement)=='number',('Placement accepts type number got %s'):
format(typeof(l.Placement)))end if l.InitialValue then assert(typeof(l.InitialValue)=='number',(
'InitialValue accepts type number got %s'):format(typeof(l.InitialValue)))end local m,p,q,t,u=d(l.Name),d(l.Callback),d(
l.Max),d(l.Min),d(l.Placement or 0)local F,G,H,I,K,L,M,N=d(l.InitialValue or h(t)),l.tabColor or nil,d(),d(),d(false),d(
false),d(false),d''local function O(P)if h(u)==0 then return math.floor(P)end return tonumber(string.format('%.'..h(u)..
'f',P))end local function P(Q,R,S,T,U)return(1-((Q-R)/(S-R)))*T+((Q-R)/(S-R))*U end local function Q(R)return O(P(R,0,
180,h(t),h(q)))end local R,S=d(0),d(h(t))g(S):onChange(function()R:set(P(h(S),h(t),h(q),0,1))if not h(M)then task.spawn(
h(p),h(S))end end)if h(F)<h(t)or h(F)>h(q)then warn('InitialValue for '..h(m)..
' is either too big or too small! InitialValue = '..tostring(h(t)))F:set(h(t))end ah.InputEnded:Connect(function(T)if(T.
UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch)and h(L)then L:set(false)end
end)local T=aj'Frame'{Size=UDim2.new(1,0,0,40),ClipsDescendants=true,BackgroundColor3=j(function()return i.get
'secondaryBackground'end,40,1),Parent=l.Parent,[b'MouseEnter']=function()K:set(true)end,[b'MouseLeave']=function()K:set(
false)end,[c]={{{aj'Frame'{ZIndex=4,Visible=e(function()return h(M)end),Size=UDim2.fromScale(1,1),BackgroundTransparency
=0.1,BackgroundColor3=j(function()return i.get'tertiaryBackground'end,40,1),[c]={aj'ImageLabel'{AnchorPoint=Vector2.new(
0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=j(function()return
i.get'image'end,40,1),Image=k.lock},aj'TextLabel'{Text=e(function()return h(N)end),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=
j(function()return i.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[c]={aj
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},aj'UICorner'{CornerRadius=UDim.new(0,6)}}}},aj'UICorner'{
CornerRadius=UDim.new(0,6)},aj'Frame'{ZIndex=2,Size=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.
fromScale(0.5,0),BackgroundTransparency=0.85,BackgroundColor3=j(function()return G or i.get'defaultTab'end,40,1),[c]={aj
'UICorner'{CornerRadius=UDim.new(0,6)}}},aj'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-220,0,14),AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=0,TextColor3=j(function()return i.get'text'end,40,1),Text=h(m),[c]={aj
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}},aj'CanvasGroup'{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
new(1,-10,0.5,0),BackgroundColor3=j(function()return i.get'image'end,40,1),Size=j(function()if h(K)and not h(M)then
return UDim2.fromOffset(180,16)end return UDim2.fromOffset(180,4)end,40,1),[c]={aj'UICorner'{CornerRadius=j(function()if
h(K)then return UDim.new(0,4)end return UDim.new(0,6)end,40,1)},aj'TextButton'{Interactable=e(function()return not h(M)
end),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency
=1,[b'MouseButton1Down']=function()L:set(true)end,[b'TouchLongPress']=function()L:set(true)end,[b'InputBegan']=function(
T)if T.UserInputType==Enum.UserInputType.MouseButton1 or T.UserInputType==Enum.UserInputType.Touch then local U,V=ah:
GetMouseLocation().X,h(H).Size.X.Offset local W=U-(h(H).AbsolutePosition.X+V)while h(L)and not h(M)and task.wait()do
local X=ah:GetMouseLocation().X local Z=math.clamp(V+(X-U)+W,0,180)S:set(Q(Z))ag.RenderStepped:Wait()end end end,[f]=I,[
c]={aj'Frame'{Name='ChangeThing',AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=j(
function()return G or i.get'defaultTab'end,40,1),Size=j(function()return UDim2.fromScale(h(R),1)end,60,1),[f]=H}}}}},aj
'TextLabel'{AnchorPoint=Vector2.new(1,0.5),Size=UDim2.fromOffset(20,14),Position=UDim2.new(1,-195,0.5,0),
BackgroundTransparency=1,Text=e(function()return tostring(h(S))end),TextColor3=j(function()return i.get'text'end,40,1),
Font=Enum.Font.Gotham,TextSize=14,TextXAlignment=Enum.TextXAlignment.Right,TextScaled=true,[c]={aj'UITextSizeConstraint'
{MinTextSize=1,MaxTextSize=14}}}}}S:set(h(F))local U={}function U.Remove(V)T:Destroy()end function U.SetValue(V,W)if
typeof(W)=='number'and(W<=h(q))and(W>=h(t))then S:set(W)elseif typeof(W)~='number'then error("You didn't give "..h(m)..
' a number for SetValue')else error('Your SetValue for '..h(m)..' is great or smaller than the maximum or minimum')end
end function U.SetMin(V,W)if typeof(W)=='number'and(W<h(q))then t:set(W)local X=h(I)X.ChangeThing.ZIndex=2 X.ChangeThing
.ZIndex=1 elseif typeof(W)~='number'then error("You didn't give "..h(m)..' a number for SetMin')else error(
'Your SetMin for '..h(m)..' is great than the maximum')end end function U.SetMax(V,W)if typeof(W)=='number'and(W<h(t))
then q:set(W)local X=h(I)X.ChangeThing.ZIndex=2 X.ChangeThing.ZIndex=1 elseif typeof(W)~='number'then error(
"You didn't give "..h(m)..' a number for SetMax')else error('Your SetMax for '..h(m)..' is smaller than the minimum')end
end function U.Lock(V,W)M:set(true)N:set(W or'Locked')end function U.Unlock(V)M:set(false)end return U end end)()end,[84
]=function()local aa,ab,ac=a(84)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Bundles.data),
ac(ae.Bundles.Fusion)local ah,ai,aj,b,c,d,e,f,g,h,i=ag.New,ag.OnEvent,ag.Children,ag.Value,ag.Ref,ag.Observer,ac(ae.
utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.getStringBounds),ac(ae.utilities.animate),ac(ae.utilities.
randomString)return function(j)local k=e(j.tab_data.data)k.Parent=j.Parent local l,m,p,q,t=af.find'selectedTab',af.find
'selectedFirst',b(k.Name),k.tabColor or nil,b(false)d(l.data):onChange(function()if e(l.data).uid==k.uid then t:set(true
)else t:set(false)end end)local u,F,G=b(false),b(0),b()do local H=g(e(p),{TextSize=14,Font=Enum.Font.GothamMedium,
VectorSize=Vector2.new(10000,14)})if H.X<449 then F:set(math.abs(H.X))else for I=1,14 do local K=g(e(p),{TextSize=14-I,
Font=Enum.Font.GothamMedium,VectorSize=Vector2.new(450,40)})if K.X<450 and K.Y<14 then F:set(math.abs(K.X+1))break end
end end end ah'TextButton'{ZIndex=5,Name=i(16),Parent=k.Parent,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromOffset(
30,30),BackgroundColor3=h(function()return f.get'secondaryBackground'end,40,1),ClipsDescendants=true,Text='',Size=h(
function()if e(u)then return UDim2.fromOffset(e(F)+50,40)else return UDim2.fromOffset(40,40)end end,20,1),[ai
'MouseEnter']=function()u:set(true)end,[ai'MouseLeave']=function()u:set(false)end,[ai'Activated']=function()l:update(
'data',e(j.tab_data.data))end,[aj]={ah'UICorner'{CornerRadius=h(function()if e(u)then return UDim.new(0,10)else return
UDim.new(1,0)end end,30,1)},ah'ImageLabel'{ZIndex=5,Name='icon',AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,6,
0.5,0),Size=UDim2.fromOffset(28,28),BackgroundTransparency=1,Image=k.Image,ImageColor3=h(function()if e(u)and not e(t)
then return q or f.get'defaultTab'elseif not e(u)and not e(t)then return f.get'image'else return q or f.get'defaultTab'
end end,30,1)},ah'TextLabel'{ZIndex=5,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(0,e(F
),0,14),BackgroundTransparency=1,Text=k.Name,TextScaled=true,TextTransparency=h(function()if e(u)then return 0 end
return 1 end,20,1),Font=Enum.Font.GothamMedium,TextColor3=h(function()return f.get'text'end,40,1),TextXAlignment=Enum.
TextXAlignment.Left,[c]=G,[aj]={ah'UITextSizeConstraint'{MaxTextSize=14,MinTextSize=1}}}}}if not e(m.boolean)then m:
update('boolean',true)l:update('data',e(j.tab_data.data))end end end)()end,[85]=function()local aa,ab,ac=a(85)local ad
return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b,c,d,e,f,g,h=af.New,af.
OnEvent,af.Children,af.Value,af.Computed,af.Ref,af.Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.
utilities.animate),ac(ae.Bundles.icons)return function(i)assert(i.Name,':TextBox missing property Name')assert(typeof(i.
Name)=='string',('Name accepts type string got %s'):format(typeof(i.Name)))assert(i.Callback,
':TextBox missing property Callback')assert(typeof(i.Callback)=='function',('Callback accepts type function got %s'):
format(typeof(i.Callback)))if i.Default then assert((typeof(i.Default)=='string'or typeof(i.Default)=='number'),(
'Default accepts type string or number got %s'):format(typeof(i.Default)))end if i.PlaceHolderText then assert(typeof(i.
PlaceHolderText)=='string',('PlaceHolderText accepts type string got %s'):format(typeof(i.PlaceHolderText)))end if i.
OnlyNumbers then assert(typeof(i.OnlyNumbers)=='boolean',('OnlyNumbers accepts type boolean got %s'):format(typeof(i.
OnlyNumbers)))end if i.OnLeave then assert(typeof(i.OnLeave)=='boolean',('OnLeave accepts type boolean got %s'):format(
typeof(i.OnLeave)))end local j,k,l,m,p,q,t,u,F,G,H=aj(i.Name),aj(i.Callback),aj(i.Default or''),aj(i.OnlyNumbers or
false),aj(i.OnLeave or false),i.tabColor or nil,aj(),aj'',aj(false),aj(false),aj''local I=aj(e(u))d(u):onChange(function
()if e(m)then if tonumber(e(u))or e(u)==''then I:set(e(u))end else I:set(e(u))end local K=e(t)if K and K.Text then K.
Text=e(I)end end)if e(p)then d(F):onChange(function()if not e(F)then if e(m)then if tonumber(e(u))then task.spawn(e(k),
e(u))end else task.spawn(e(k),e(u))end end end)else d(u):onChange(function()if e(m)then if tonumber(e(u))then task.
spawn(e(k),e(u))end else task.spawn(e(k),e(u))end end)end if e(l)~=''then u:set(e(l))end local K,L=ag'TextButton'{Parent
=i.Parent,Interactable=b(function()return not e(G)end),Size=UDim2.new(1,0,0,40),BackgroundColor3=g(function()return f.
get'secondaryBackground'end,40,1),[ah'MouseButton1Click']=function()local K=e(t)K:CaptureFocus()end,[ai]={{{ag'Frame'{
ZIndex=4,Visible=b(function()return e(G)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,BackgroundColor3=g(
function()return f.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.
fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=g(function()return f.get'image'end,
40,1),Image=h.lock},ag'TextLabel'{Text=b(function()return e(H)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,
44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=g(function()return f.
get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{
MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,6)},ag
'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),
BackgroundTransparency=0.85,BackgroundColor3=g(function()return q or f.get'defaultTab'end,40,1),[ai]={ag'UICorner'{
CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-185,0,14),AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=0,Text=e(j),TextColor3=g(function()return f.get'text'end,40,1),[ai]={ag
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag'Frame'{ZIndex=3,Size=UDim2.new(0,160,0,24),AnchorPoint=Vector2
.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=0.25,BackgroundColor3=g(function()return f.get
'secondaryBackground'end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'TextBox'{Interactable=b(function()
return not e(G)end),ZIndex=3,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),Size=UDim2.new(0,160,0,24),
BackgroundTransparency=1,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,PlaceholderText='Input Here',Font=Enum.
Font.Gotham,TextSize=12,PlaceholderColor3=g(function()return f.get'placeholder'end,40,1),Text=b(function()if e(l)~=''
then return e(l)end return''end),TextColor3=g(function()if e(F)then return f.get'text'else return q or f.get'defaultTab'
end end,50,1),[ah'Focused']=function()F:set(true)end,[ah'FocusLost']=function()F:set(false)end,[ah'Changed']=function(K)
if K=='Text'then local L=e(t)u:set(L.Text)end end,[c]=t,[ai]={ag'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.
new(0,5)},ag'UITextSizeConstraint'{MaxTextSize=12,MinTextSize=1}}}}},{}function L.Remove(M)K:Destroy()end function L.
SetInput(M,N)if typeof(N)=='string'then e(t).Text=N else error("You didn't give "..e(j)..' a string for setInput')end
end function L.Lock(M,N)G:set(true)H:set(N or'Locked')end function L.Unlock(M)G:set(false)end return L end end)()end,[86
]=function()local aa,ab,ac=a(86)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)
local ag,ah,ai,aj,b,c,d,e,f,g=af.New,af.OnEvent,af.Children,af.Value,af.Computed,af.Observer,ac(ae.utilities.get),ac(ae.
Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.Bundles.icons)return function(h)assert(h.Name,
':Toggle missing property Name')assert(typeof(h.Name)=='string',('Name accepts type string got %s'):format(typeof(h.Name
)))assert(h.Callback,':Toggle missing property Callback')assert(typeof(h.Callback)=='function',(
'Callback accepts type function got %s'):format(typeof(h.Callback)))if h.Default then assert(typeof(h.Default)==
'boolean',('Default accepts type boolean got %s'):format(typeof(h.Default)))end local i,j,k,l,m,p,q=aj(h.Name),aj(h.
Callback),aj(h.Default or false),h.tabColor or nil,aj(false),aj(false),aj''c(m):onChange(function()if not d(p)then task.
spawn(d(j),d(m))end end)local t=ag'TextButton'{Parent=h.Parent,Interactable=b(function()return not d(p)end),Size=UDim2.
new(1,0,0,40),AutoButtonColor=false,BackgroundColor3=f(function()return e.get'secondaryBackground'end,40,1),[ah
'Activated']=function()m:set(not d(m))end,[ai]={{ag'Frame'{ZIndex=3,Visible=b(function()return d(p)end),Size=UDim2.
fromScale(1,1),BackgroundTransparency=0.1,BackgroundColor3=f(function()return e.get'tertiaryBackground'end,40,1),[ai]={
ag'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),
BackgroundTransparency=1,ImageColor3=f(function()return e.get'image'end,40,1),Image=g.lock},ag'TextLabel'{Text=b(
function()return d(q)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=
Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=f(function()return e.get'text'end,40,1),TextSize=16,TextScaled=
true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'
{CornerRadius=UDim.new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=0.85,BackgroundColor3=f(function
()return l or e.get'defaultTab'end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{
BackgroundTransparency=1,Size=UDim2.new(1,-45,0,14),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=
Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,TextColor3=f(
function()return e.get'text'end,40,1),Text=d(i),[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag
'ImageLabel'{AnchorPoint=Vector2.new(1,0),Position=UDim2.new(1,-5,0,6),Size=UDim2.fromOffset(28,28),
BackgroundTransparency=1,Image=g.emptyBox,ImageColor3=f(function()return e.get'image'end,40,1),[ai]={ag'UICorner'{
CornerRadius=UDim.new(1,0)},ag'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2
.new(1,0,1,0),BackgroundTransparency=1,Image=g.filledBox,ImageColor3=f(function()return e.get'image'end,40,1),
ImageTransparency=f(function()if d(m)then return 0 end return 1 end,30,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(1,0)}
}}}}}}m:set(d(k))local u={}function u.Remove(F)t:Destroy()end function u.SetValue(F,G)if typeof(G)=='boolean'then m:set(
G)else error("You didn't give "..d(i)..' a boolean for SetValue')end end function u.Lock(F,G)p:set(true)q:set(G or
'Locked')end function u.Unlock(F)p:set(false)end return u end end)()end,[87]=function()local aa,ab,ac=a(87)local ad
return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b=af.New,af.Children,ac(ae
.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.randomString)return function(c)return ag'ScrollingFrame'{
Name=b(16),Parent=c.Parent,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),ScrollBarThickness=0,CanvasSize=UDim2.new(
0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[ah]={ag'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.
LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center},ag'TextLabel'
{Size=UDim2.new(1,0,0,20),Text=c.Name,BackgroundTransparency=1,TextScaled=true,Font=Enum.Font.GothamMedium,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.75,TextColor3=aj(function()return ai.get'text'end,40,1),[ah]=
{ag'UITextSizeConstraint'{MaxTextSize=12,MinTextSize=1},ag'UIPadding'{PaddingLeft=UDim.new(0,5)}}}}}end end)()end,[89]=
function()local aa,ab,ac=a(89)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Bundles.data),ac(
ae.Bundles.services)local ah,ai,aj=ag.UserInputService,ag.RunService,ac(ae.Bundles.Fusion)local b,c,d,e,f,g,h,i,j,k,l,m,
p=aj.New,aj.OnEvent,aj.Children,aj.Value,aj.Ref,aj.Observer,aj.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),
ac(ae.utilities.references),ac(ae.Bundles.themeSystem),ac(ae.Bundles.icons),ac(ae.utilities.drag)return function(q)local
t,u,F,G,H,I,K,L,M,N=af.find'selectedTab',af.find'keyCode',e(),e(false),af.find'isToggled',e(false),e(q.Size.X),(e(q.Size
.Y))g(I):onChange(function()if not i(I)and N~=nil then N:Disconnect()N=nil end end)local O=e()k.add(O)local P=e()k.add(P
)local Q=e()k.add(Q)local R=e()k.add(R)local S=e()g(t.data):onChange(function()local T,U=i(t.data),i(Q)U:JumpTo(T.
tabPage)end)local T=ah.InputBegan:Connect(function(T,U)if not U and T.KeyCode and T.KeyCode==i(u.EnumItem)then H:update(
'boolean',not i(H.boolean))end end)M=b'ScreenGui'{Name=q.Title,Parent=q.Parent,IgnoreGuiInset=true,ResetOnSpawn=false,
Enabled=h(function()return i(H.boolean)end),[c'Destroying']=function()T:Disconnect()N:Disconnect()end,[d]={b'Frame'{Name
='container',BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0),Position=UDim2.new(0.5,-i(K)/2,0.5,-i(L)/2),Size=h(
function()return UDim2.fromOffset(i(K),45)end),[f]=F,[d]={b'Frame'{AnchorPoint=Vector2.new(0,0),Position=UDim2.
fromScale(0,0),ClipsDescendants=true,BackgroundColor3=j(function()return l.get'background'end,40,1),Size=j(function()if
i(G)then return UDim2.fromOffset(i(K),45)end return UDim2.fromOffset(i(K),i(L))end,20,1),[d]={b'UICorner'{CornerRadius=
UDim.new(0,6)},b'Frame'{ZIndex=5,AnchorPoint=Vector2.new(0,0),Position=UDim2.fromOffset(10,50),Size=UDim2.new(1,0,0,466)
,ClipsDescendants=true,BackgroundTransparency=1,[d]={b'ScrollingFrame'{Name='sideBar',AnchorPoint=Vector2.new(0,0),
Position=UDim2.fromScale(0,0),Size=UDim2.new(0,40,1,0),BackgroundTransparency=1,ScrollBarThickness=0,ClipsDescendants=
false,ZIndex=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[f]=O,[d]={b'UIListLayout'{Padding
=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Left}}}}},b'Frame'{Name='topBar',AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),Size=
UDim2.new(1,0,0,45),BackgroundTransparency=1,[d]={b'UICorner'{CornerRadius=UDim.new(0,6)},b'Frame'{AnchorPoint=Vector2.
new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,1),BackgroundColor3=j(function()return l.get
'tertiaryBackground'end,40,1),BackgroundTransparency=j(function()if i(G)then return 1 else return 0 end end,20,1)},b
'Frame'{Name='taskManage',BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Size=
UDim2.new(0,70,1,0),[d]={b'UIListLayout'{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.
HorizontalAlignment.Center,VerticalAlignment=Enum.VerticalAlignment.Center},b'Frame'{Size=UDim2.fromOffset(30,30),
BackgroundTransparency=1,[d]={b'TextButton'{Name='toggleMini',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(30,30),[c'Activated']=function()G:set(not i(G))end,[d]={b
'ImageLabel'{Name='maximizeIcon',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,
0.5),Size=UDim2.fromOffset(26,26),Image=m.maximize,ImageColor3=j(function()return l.get'image'end,40,1),
ImageTransparency=j(function()if i(G)then return 0 else return 1 end end,25,1)},b'ImageLabel'{Name='minimizeIcon',
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(26,26)
,Image=m.minimize,ImageColor3=j(function()return l.get'image'end,40,1),ImageTransparency=j(function()if i(G)then return
1 else return 0 end end,25,1)}}}}},b'TextButton'{Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Text='',[c
'Activated']=function()M:Destroy()end,[d]={b'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,
0.5),Size=UDim2.fromScale(0.95,0.95),BackgroundTransparency=1,Image=m.close,ImageTransparency=0,ImageColor3=j(function()
return l.get'close'end,40,1)}}}}},b'TextLabel'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.55),Size=
UDim2.fromOffset(350,25),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextScaled=true,TextSize=25,TextXAlignment=
Enum.TextXAlignment.Left,Text=q.Title,TextColor3=j(function()return i(t.data).tabColor or l.get'defaultTab'end,15,1),[d]
={b'UIPadding'{PaddingLeft=UDim.new(0,15)},b'UITextSizeConstraint'{MaxTextSize=25,MinTextSize=1}}}}},b'Frame'{Name=
'windowsList',AnchorPoint=Vector2.new(0,0),Size=j(function()return UDim2.new(0,i(K)-70,0,i(L)-60)end,20,1),Position=
UDim2.new(0,60,0,50),BackgroundTransparency=1,ClipsDescendants=true,[f]=P,[d]={b'UIPageLayout'{EasingDirection=Enum.
EasingDirection.In,EasingStyle=Enum.EasingStyle.Sine,TweenTime=0.2,FillDirection=Enum.FillDirection.Vertical,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,20),[f]=Q}}},b'TextButton'{Name='Resizer',AnchorPoint=Vector2.new(1,1),
Position=UDim2.fromScale(1,1),Size=UDim2.fromOffset(10,10),BackgroundTransparency=1,Interactable=h(function()return not
i(G)end),[f]=S,[c'InputBegan']=function(U)if not i(G)and(U.UserInputType==Enum.UserInputType.MouseButton1 or U.
UserInputType==Enum.UserInputType.Touch)then local V,W=i(S),Vector2.new(9e9,9e9)local X,Z,_=V.AbsolutePosition,i(K),i(L)
if N==nil then N=ai.Heartbeat:Connect(function()if i(I)then local al=ah:GetMouseLocation()-X if al~=W then W=al K:set(
math.clamp(al.X+Z-10,550,9e9))L:set(math.clamp(al.Y+_-10,400,9e9))end end end)end I:set(true)U.Changed:Connect(function(
)if U.UserInputState==Enum.UserInputState.End then task.wait()I:set(false)end end)end end}}}}},b'ScrollingFrame'{Name=
'NotificationList',ZIndex=0,AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-5,1,-10),Size=UDim2.new(0,1,1,-10),
BackgroundTransparency=1,ScrollBarThickness=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=false,[f]=R,[d]=
{b'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment
.Right,VerticalAlignment=Enum.VerticalAlignment.Bottom}}}}}p(i(F),15)return M end end)()end,[90]=function()local aa,ab,
ac=a(90)local ad return(function(...)local ae=ab.Parent.Parent local af,ag=ac(ae.Bundles.data),ac(ae.Bundles.services)
local ah,ai=ag.UserInputService,ac(ae.Bundles.Fusion)local aj,al,b,c,d,e,f,g,h,i,j=ai.New,ai.OnEvent,ai.Children,ai.
Value,ai.Ref,ai.Observer,ai.Computed,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.
utilities.references)return function(k)local l,m,p,q,t,u=af.find'selectedTab',c(false),af.find'isToggled',af.find
'keyCode',(c())j.add(t)local F=c()j.add(F)local G=c()j.add(G)local H=c()j.add(H)local I=ah.InputBegan:Connect(function(I
,K)if not K and I.KeyCode and I.KeyCode==g(q.EnumItem)then p:update('boolean',not g(p.boolean))end end)e(l.data):
onChange(function()local K,L=g(l.data),g(G)L:JumpTo(K.tabPage)end)u=aj'ScreenGui'{Name=k.Title,Parent=k.Parent,
IgnoreGuiInset=false,ResetOnSpawn=false,Enabled=f(function()return g(p.boolean)end),[al'Destroying']=function()I:
Disconnect()end,[b]={aj'Frame'{Name='container',AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,5,1,-5),
ClipsDescendants=true,BackgroundColor3=i(function()return h.get'background'end,40,1),Size=i(function()if g(m)then return
UDim2.new(0.75,0,1,-10)else return UDim2.fromOffset(40,40)end end,45,1),[b]={{aj'UICorner'{CornerRadius=UDim.new(0,6)},
aj'TextButton'{Name='activator',ZIndex=2,AnchorPoint=Vector2.new(0,1),Size=UDim2.fromOffset(40,40),Position=UDim2.
fromScale(0,1),BackgroundTransparency=1,ClipsDescendants=true,[al'Activated']=function()m:set(not g(m))end,[b]={aj
'UICorner'{CornerRadius=UDim.new(0,6)},aj'ImageLabel'{Name='maximizeIcon',AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,Size=UDim2.fromOffset(30,30),Image='rbxassetid://15556636376',ImageColor3=i(function()return h.
get'image'end,40,1),ImageTransparency=i(function()if g(m)then return 1 else return 0 end end,45,1),Position=i(function()
if g(m)then return UDim2.fromScale(0.5,1.5)else return UDim2.fromScale(0.5,0.5)end end,25,1)},aj'ImageLabel'{Name=
'minimizeIcon',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Size=UDim2.fromOffset(30,30),Image=
'rbxassetid://15556637715',ImageColor3=i(function()return h.get'image'end,40,1),ImageTransparency=i(function()if g(m)
then return 0 else return 1 end end,45,1),Position=i(function()if g(m)then return UDim2.fromScale(0.5,0.5)else return
UDim2.fromScale(0.5,1.5)end end,25,1)}}},aj'ScrollingFrame'{Name='sideBar',Size=UDim2.new(0,50,1,-80),Position=UDim2.
fromOffset(0,40),BackgroundTransparency=1,ScrollBarThickness=0,ClipsDescendants=false,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,[d]=t,[b]={aj'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.
LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left},aj'UIPadding'{
PaddingLeft=UDim.new(0,10)}}},aj'Frame'{Name='topBar',Size=UDim2.new(1,0,0,40),BackgroundTransparency=1,ZIndex=0,[b]={aj
'TextLabel'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.new(1,-40,0,24),
BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextScaled=true,TextSize=24,TextXAlignment=Enum.TextXAlignment.Left,
Text=k.Title,TextColor3=i(function()return g(l.data).tabColor or h.get'defaultTab'end,15,1),TextTransparency=i(function(
)if g(m)then return 0 else return 1 end end,45,1),[b]={aj'UIPadding'{PaddingLeft=UDim.new(0,10)},aj
'UITextSizeConstraint'{MaxTextSize=24,MinTextSize=1}}},aj'TextButton'{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
fromScale(1,0.5),Size=UDim2.fromOffset(40,40),BackgroundTransparency=1,Text='',ZIndex=0,[al'Activated']=function()u:
Destroy()end,[b]={aj'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromScale(0.9,0.9),Rotation=45,BackgroundTransparency=1,Image='rbxassetid://15556635005',ImageColor3=i(function()return
h.get'close'end,40,1),ImageTransparency=i(function()if g(m)then return 0 else return 1 end end,45,1)}}}}},aj'Frame'{Name
='windowsList',ZIndex=0,Position=UDim2.fromOffset(50,40),Size=UDim2.new(1,-50,1,-40),BackgroundTransparency=1,
ClipsDescendants=true,[d]=F,[b]={aj'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,10),PaddingTop=UDim.
new(0,5),PaddingBottom=UDim.new(0,5)},aj'UIPageLayout'{Name='UIPageLayout',EasingDirection=Enum.EasingDirection.In,
EasingStyle=Enum.EasingStyle.Sine,TweenTime=0.2,FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,20),[d]=G}}}}}},aj'ScrollingFrame'{Name='notifications',ZIndex=0,AnchorPoint=Vector2.new(
1,1),Position=UDim2.new(1,-5,1,-10),Size=UDim2.new(0,1,1,-10),BackgroundTransparency=1,ScrollBarThickness=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=false,[d]=H,[b]={aj'UIListLayout'{Padding=UDim.new(0,5),
SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.
VerticalAlignment.Bottom}}}}}return u end end)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)
return{defaultTab=Color3.fromHex'#a49ae6',background=Color3.fromRGB(40,44,50),secondaryBackground=Color3.fromRGB(49,56,
66),tertiaryBackground=Color3.fromRGB(57,63,75),text=Color3.fromRGB(220,221,225),image=Color3.fromRGB(220,221,225),
placeholder=Color3.fromRGB(165,166,169),close=Color3.fromRGB(190,100,105)}end)()end,[92]=function()local aa,ab,ac=a(92)
local ad return(function(...)local ae,af=ac(ab.Parent),{Dracula={defaultTab=Color3.fromRGB(254,126,92),background=Color3
.fromRGB(40,42,54),secondaryBackground=Color3.fromRGB(50,52,64),tertiaryBackground=Color3.fromRGB(45,47,59),text=Color3.
fromRGB(204,204,204),image=Color3.fromRGB(204,204,204),placeholder=Color3.fromRGB(165,166,169),close=Color3.fromRGB(190,
100,105)},Dark={defaultTab=Color3.fromRGB(150,150,150),background=Color3.fromRGB(26,27,33),secondaryBackground=Color3.
fromRGB(34,35,39),tertiaryBackground=Color3.fromRGB(22,22,22),text=Color3.fromRGB(230,230,230),image=Color3.fromRGB(94,
93,93),placeholder=Color3.fromRGB(79,79,79),close=Color3.fromRGB(190,100,105)},Default={},Eyebleed={defaultTab=Color3.
fromRGB(255,67,211),background=Color3.fromRGB(195,198,217),secondaryBackground=Color3.fromRGB(127,130,140),
tertiaryBackground=Color3.fromRGB(116,137,100),text=Color3.fromRGB(116,57,108),image=Color3.fromRGB(244,162,162),
placeholder=Color3.fromRGB(57,181,103),close=Color3.fromRGB(181,177,67)}}return function(ag)local ah=ae:Window{Title=
'Quake Window',Parent=ag,isMobile=true}local ai,aj,al=ah:Tab{Name='Quake Tab 1',Image='rbxassetid://10734908793'},ah:Tab
{Name='Quake Tab 2',tabColor=Color3.fromRGB(255,120,222),Image='rbxassetid://10734919691'},ah:Tab{Name='Quake Tab 3',
tabColor=Color3.fromRGB(65,253,123),Image='rbxassetid://10734950309'}ai:Button{Name='Quake Button',Callback=function()
print'Quake Button'end}ai:Toggle{Name='Quake Toggle',Default=false,Callback=function(b)print('Quake Toggle',b)end}ai:
Slider{Name='Quake Slider',Min=0,Max=100,InitialValue=0,Callback=function(b)print('Quake Slider',b)end}ai:Dropdown{Name=
'Quake Multiselect Dropdown',Items={'Apple','Banana','Carrot','Dingleberry'},Default='Apple',Multiselect=true,Callback=
function(b)print('Quake Dropdown',b)end}ai:TextBox{Name='Quake TextBox',Default='heyy',OnLeave=true,OnlyNumbers=true,
Callback=function(b)print('Quake TextBox',b)end}ai:Keybind{Name='Quake Keybind',Default='F',Callback=function()ae:
ToggleQuake()end}ai:ColorPicker{Name='Quake Color Picker',Color=Color3.fromHex'#a49ae6',Callback=function(b)print(
'Quake Color Picker',b)end}ai:Label'Quake Label'ai:Section'Quake Section'ai:Paragraph{Title='Quake Paragraph',Body=
'Quake Paragraph'}aj:Label'Quake Group Below'local b=aj:Group{Name='Quake Group',Icon='rbxassetid://10734950309'}b:
Button{Name='Quake Button',Callback=function()print'Quake Button'end}b:Toggle{Name='Quake Toggle',Default=false,Callback
=function(c)print('Quake Toggle',c)end}b:Slider{Name='Quake Slider',Min=0,Max=100,Step=1,InitialValue=0,Callback=
function(c)print('Quake Slider',c)end}b:Dropdown{Name='Quake Dropdown',Items={'Apple','Banana','Carrot','Dingleberry'},
Multiselect=false,Callback=function(c)print('Quake Dropdown',c)end}b:TextBox{Name='Quake TextBox',Default='',Callback=
function(c)print('Quake TextBox',c)end}b:Keybind{Name='Quake Keybind',Default='E',Callback=function()print
'Quake Keybind'end}b:ColorPicker{Name='Quake Color Picker',Color=Color3.fromHex'#a49ae6',Callback=function(c)print(
'Quake Color Picker',c)end}b:Label'Quake Label'b:Section'Quake Section'b:Paragraph{Title='Quake Paragraph',Body=
'Quake Paragraph'}aj:Dropdown{Name='Switch Theme',Items={'Dracula','Dark','Default','Eyebleed'},Default='Default',
Callback=function(c)ae:SetCustomTheme(af[c])end}local c=al:Slider{Name='Slider To Lock',Max=150,Min=37,Callback=function
(c)end}al:Toggle{Name='Lock Slider',Default=false,Callback=function(d)if d then c:Lock'Buy Premium!!'else c:Unlock()end
end}return function()ae:Destroy()end end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(function(...)local
ae=ac(ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return function(ah,ai,aj)return ag(af(ah),ai,aj)
end end)()end,[95]=function()local aa,ab,ac=a(95)local ad return(function(...)local ae,af,ag={},{},ac(ab.Parent.Parent.
Bundles.services)local ah=ag.ContextActionService function af.add(ai)table.insert(ae,ai)end function af.
deleteConnections()for ai,aj in ae do aj:Disconnect()ae[ai]=nil end ah:UnbindAllActions()end return af end)()end,[96]=
function()local aa,ab,ac=a(96)local ad return(function(...)local ae={}function ae.cloneref(af)if cloneref then return
cloneref(af)else return af end end ae.getgenv=getgenv or nil return ae end)()end,[97]=function()local aa,ab,ac=a(97)
local ad return(function(...)return function(ae,af)local ag,ah=ac(ab.Parent.Parent.Bundles.services),af or 10 local ai,
aj,al,b,c,d,e=ag.UserInputService,ag.RunService,ae local function f(g,h,i)return g+(h-g)*i end local function g(h)if not
(e)then return end if not(b)and(d)then al.Position=UDim2.new(e.X.Scale,f(al.Position.X.Offset,d.X.Offset,h*ah),e.Y.Scale
,f(al.Position.Y.Offset,d.Y.Offset,h*ah))return end local i=(c-ai:GetMouseLocation())local j,k=(e.X.Offset-i.X),(e.Y.
Offset-i.Y)d=UDim2.new(e.X.Scale,j,e.Y.Scale,k)al.Position=UDim2.new(e.X.Scale,f(al.Position.X.Offset,j,h*ah),e.Y.Scale,
f(al.Position.Y.Offset,k,h*ah))end al.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1
or h.UserInputType==Enum.UserInputType.Touch then b=true e=al.Position c=ai:GetMouseLocation()h.Changed:Connect(function
()if h.UserInputState==Enum.UserInputState.End then b=false end end)end end)local h=aj.Heartbeat:Connect(g)return h end
end)()end,[98]=function()local aa,ab,ac=a(98)local ad return(function(...)return function(ae,af)if typeof(ae)=='table'
and ae.type=='State'then return ae:get(af)end return ae end end)()end,[99]=function()local aa,ab,ac=a(99)local ad return
(function(...)return function(ae:string,af)ae=ae or''af=af or{TextSize=14,Font=Enum.Font.Arial,VectorSize=Vector2.new(
200,50)}local ag=game:GetService'TextService'return ag:GetTextSize(ae,af.TextSize,af.Font,af.VectorSize)end end)()end,[
100]=function()local aa,ab,ac=a(100)local ad return(function(...)local ae,af=Color3.new(0,0,0),Color3.new(1,1,1)return
function(ag:Color3,ah:string,ai:number)local aj=string.lower(ah)if ah=='black'then return ag:Lerp(ae,ai)elseif ah==
'white'then return ag:Lerp(af,ai)else return error'hey its not white or black'end end end)()end,[101]=function()local aa
,ab,ac=a(101)local ad return(function(...)return function(ae,af)if ae.R==af.R and ae.G==af.G and ae.B==af.B then return
true end return false end end)()end,[102]=function()local aa,ab,ac=a(102)local ad return(function(...)local ae={}for af=
48,57 do table.insert(ae,string.char(af))end for af=65,90 do table.insert(ae,string.char(af))end for af=97,122 do table.
insert(ae,string.char(af))end local function af(ag)if ag>0 then return af(ag-1)..ae[math.random(1,#ae)]else return''end
end return af end)()end,[103]=function()local aa,ab,ac=a(103)local ad return(function(...)local ae,af,ag,ah={},{},ac(ab.
Parent.Parent.Bundles.Fusion).Observer,ac(ab.Parent.get)function af.add(ai)if typeof(ah(ai))~='Instance'then ag(ai):
onChange(function()if typeof(ah(ai))=='Instance'then if not ae[ah(ai).Name]then ae[ah(ai).Name]=ah(ai)else warn(ah(ai).
Name,' REF was already added')end end end)else if not ae[ah(ai).Name]then ae[ah(ai).Name]=ah(ai)else warn(ah(ai).Name,
' REF was already added')end end end function af.get(ai)if ae[ai]then return ae[ai]end end function af.remove(ai)if ae[
ai]then ae[ai]=nil else warn(ai,"isn't in the references list")end end function af.clear()for ai,aj in ae do ae[ai]=nil
if typeof(aj)=='Instance'then aj:Destroy()end end end return af end)()end,[104]=function()local aa,ab,ac=a(104)local ad
return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed return function(ag,ah)return ae.
Tween(af(ag),ah)end end)()end},{{1,2,{'quake'},{{93,1,{'utilities'},{{103,2,{'references'}},{95,2,{'connections'}},{97,2
,{'drag'}},{96,2,{'customFunctions'}},{99,2,{'getStringBounds'}},{104,2,{'tween'}},{98,2,{'get'}},{94,2,{'animate'}},{
101,2,{'matchColors'}},{100,2,{'lerpColor'}},{102,2,{'randomString'}}}},{2,1,{'Bundles'},{{57,2,{'betterMathModule'},{{
62,3,{'CLASS_Check'}},{61,3,{'CLASS_Convert'}},{63,3,{'CLASS_Notation'}},{59,3,{'CLASS_Sequence'}},{65,3,{'CLASS_Random'
}},{58,3,{'CLASS_Value'}},{67,3,{'CLASS_Chance'}},{64,3,{'CLASS_Matrix'}},{60,3,{'CLASS_String'}},{66,3,{'Class_Special'
}}}},{68,2,{'data'}},{3,2,{'Fusion'},{{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{40,1,{'State'},{{41,2,{'Computed'}},{43,2,{
'ForPairs'}},{47,2,{'unwrap'}},{45,2,{'Observer'}},{42,2,{'ForKeys'}},{44,2,{'ForValues'}},{46,2,{'Value'}}}},{16,1,{
'Dependencies'},{{19,2,{'sharedState'}},{17,2,{'captureDependencies'}},{18,2,{'initDependency'}},{20,2,{'updateAll'}},{
21,2,{'useDependency'}}}},{33,1,{'Logging'},{{36,2,{'logWarn'}},{35,2,{'logErrorNonFatal'}},{37,2,{'messages'}},{38,2,{
'parseError'}},{34,2,{'logError'}}}},{49,1,{'Utility'},{{52,2,{'doNothing'}},{51,2,{'cleanup'}},{50,2,{'None'}},{53,2,{
'isSimilar'}},{54,2,{'needsDestruction'}},{55,2,{'restrictRead'}},{56,2,{'xtypeof'}}}},{39,2,{'PubTypes'}},{4,1,{
'Animation'},{{8,2,{'TweenScheduler'}},{7,2,{'Tween'}},{13,2,{'unpackType'}},{10,2,{'lerpType'}},{9,2,{'getTweenRatio'}}
,{6,2,{'SpringScheduler'}},{5,2,{'Spring'}},{11,2,{'packType'}},{12,2,{'springCoefficients'}}}},{48,2,{'Types'}},{22,1,{
'Instances'},{{27,2,{'OnChange'}},{28,2,{'OnEvent'}},{30,2,{'Ref'}},{23,2,{'Children'}},{25,2,{'Hydrate'}},{26,2,{'New'}
},{24,2,{'Cleanup'}},{31,2,{'applyInstanceProps'}},{32,2,{'defaultProps'}},{29,2,{'Out'}}}}}},{69,2,{'icons'}},{71,2,{
'themeSystem'},{{72,2,{'default'}}}},{70,2,{'services'}}}},{88,1,{'platforms'},{{89,2,{'computer'}},{90,2,{'mobile'}}}},
{73,1,{'components'},{{86,2,{'newToggle'}},{78,2,{'newKeybind'}},{87,2,{'newWindow'}},{74,2,{'newButton'}},{75,2,{
'newColorPicker'}},{79,2,{'newLabel'}},{85,2,{'newTextBox'}},{76,2,{'newDropdown'}},{84,2,{'newTab'}},{80,2,{
'newNotification'}},{77,2,{'newGroup'}},{82,2,{'newSection'}},{83,2,{'newSlider'}},{81,2,{'newParagraph'}}}},{92,2,{
'project.story'}},{91,2,{'preservedConfig'}}}}},'0.4.1','WaxRuntime',string,task,setmetatable,error,next,table,unpack,
coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local k,l,m,p,q,t,u=aj.insert,aj.remove,aj.freeze or
function(k)return k end,b.wrap,ae.sub,ae.match,ae.gmatch if i and q(i,1,4)=='Lune'then local F,G=f(e,'@lune/task')if F
and G then af=G end end local F=af and af.defer local G,H,I,K,L,M,N,O,P=F or function(G,...)p(G)(...)end,{[1]='Folder',[
2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local Q,R={GetFullName={{},
function(Q)local R,S=Q.Name,Q.Parent while S do R=S.Name..'.'..R S=S.Parent end return R end},GetChildren={{},function(Q
)local R={}for S in ai,P[Q]do k(R,S)end return R end},GetDescendants={{},function(Q)local R={}for S in ai,P[Q]do k(R,S)
for T,U in ai,S:GetDescendants()do k(R,U)end end return R end},FindFirstChild={{'string','boolean?'},function(Q,R,S)
local T=P[Q]for U in ai,T do if U.Name==R then return U end end if S then for V in ai,T do return V:FindFirstChild(R,
true)end end end},FindFirstAncestor={{'string'},function(Q,R)local S=Q.Parent while S do if S.Name==R then return S end
S=S.Parent end end},WaitForChild={{'string','number?'},function(Q,R)return Q:FindFirstChild(R)end}},{}for S,T in ai,Q do
local U,V,W=T[1],T[2],{}for X,Z in ai,U do local _,am=t(Z,'^([^%?]+)(%??)')W[X]={_,am}end R[S]=function(am,...)if not P[
am]then ah("Expected ':' not '.' calling member function "..S,2)end local _={...}for an,ao in ai,W do local ap=_[an]
local aq,ar,as=d(ap),ao[1],ao[2]if ap==nil and not as then ah('Argument '..ap..' missing or nil',3)end if ar~='any'and
aq~=ar and not(aq=='nil'and as)then ah('Argument '..an..' expects type "'..ar..'", got "'..aq..'"',2)end end return V(am
,...)end end local function am(an,ao,ap)local aq,ar=(ag({},{__mode='k'}))local function as(U)ah(U..
' is not a valid (virtual) member of '..an..' "'..ao..'"',3)end local function U(V)ah(
'Unable to assign (virtual) property '..V..'. Property is read only',3)end local V,W={},{}W.__metatable=false W.__index=
function(X,Z)if Z=='ClassName'then return an elseif Z=='Name'then return ao elseif Z=='Parent'then return ap elseif an==
'StringValue'and Z=='Value'then return ar else local _=R[Z]if _ then return _ end end for _ in ai,aq do if _.Name==Z
then return _ end end as(Z)end W.__newindex=function(X,Z,_)if Z=='ClassName'then U(Z)elseif Z=='Name'then ao=_ elseif Z
=='Parent'then if _==V then return end if ap~=nil then P[ap][V]=nil end ap=_ if _~=nil then P[_][V]=true end elseif an==
'StringValue'and Z=='Value'then ar=_ else as(Z)end end W.__tostring=function()return ao end ag(V,W)P[V]=aq if ap~=nil
then P[ap][V]=true end return V end local function an(ao,ap)local aq,ar,as,U=ao[1],ao[2],ao[3],ao[4]local V=H[ar]local W
=as and l(as,1)or V local X=am(V,W,ap)I[aq]=X if as then for Z,_ in ai,as do X[Z]=_ end end if U then for Z,_ in ai,U do
an(_,X)end end return X end local ao=am('Folder','['..ad..']')for ap,aq in ai,ab do an(aq,ao)end for ar,as in ai,aa do
local U=I[ar]K[U]=as L[U]=ar local V=U.ClassName if V=='LocalScript'or V=='Script'then k(N,U)end end local function U(V)
local W,X=V.ClassName,M[V]if X and W=='ModuleScript'then return al(X)end local Z=K[V]local function _(at)at=g(at)local
au,av,aw=V:GetFullName(),t(at,'[^:]+:(%d+): (.+)')if not av or not j then return au..':*: '..(aw or at)end av=h(av)local
ax=L[V]local ay=j[ax]local az=av-ay+1 if az<0 then az='?'end return au..':'..az..': '..aw end if W=='LocalScript'or W==
'Script'then local at,au=f(Z)if not at then ah(_(au),0)end else local at={f(Z)}local au=l(at,1)if not au then local av=
l(at,1)ah(_(av),0)end M[V]=at return al(at)end end function a(at)local au=I[at]local function av(aw,...)local ax={f(aw,
...)}local ay=l(ax,1)if not ay then ah(ax[1],3)end return al(ax)end local aw=m(ag({},{__index=O,__newindex=function(aw,
ax,ay)O[ax]=ay end,__len=function()return#O end,__iter=function()return ai,O end}))local ax,ay=m{version=ac,envname=ad,
shared=aw,script=c,require=e},au local function az(V,...)local W,X,Z=d(V),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if W=='table'and P[V]then if V.
ClassName~='ModuleScript'then ah(X,2)elseif V==au then ah(Z,2)end return U(V)elseif W=='string'and q(V,1,1)~='@'then if#
V==0 then ah('Attempted to call require with empty string',2)end local _=au if q(V,1,1)=='/'then _=ao elseif q(V,1,2)==
'./'then V=q(V,3)end local aA for aB in u(V,'([^/]*)/?')do local aC=aB if aB=='..'then aC='Parent'end if aC~=''then
local aD=_:FindFirstChild(aC)if not aD then local aE=_.Parent if aE then aD=aE:FindFirstChild(aC)end end if aD then _=aD
elseif aB~=aA and aB~='init'and aB~='init.server'and aB~='init.client'then ah('Virtual script path "'..V..'" not found',
2)end end aA=aB end if _.ClassName~='ModuleScript'then ah(X,2)elseif _==au then ah(Z,2)end return U(_)end return av(e,V,
...)end return ax,ay,az end for at,au in ai,N do G(U,au)end return U(ao:GetChildren()[1])