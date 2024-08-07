local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,b,c,d,e,f,g,h,i={function()local b,c,d=a(1)local e return(function(...
)local f=d(c.Bundles.Fusion)local g,h,i,j,k,l=f.Value,f.Observer,d(c.utilities.get),d(c.preservedConfig),d(c.Bundles.
themeSystem),{}function l.Window(m,n)assert(n.Title,':Window needs a Title')local o,p=d(c.platforms.mobile),d(c.
platforms.computer)local function q(r,s,t)t.Parent=s return d(c.components['new'..r])(t)end local r,s,t,u=g(k.get'text')
,g(tostring(math.random(1,100))),g(true),{}local function v(w:string)local x,y=w,''for z=1,5 do y=y..tostring(math.abs(
math.random(0,9)))end local z=x..y u[x]=z return u[x]end n.Parent=n.Parent or game.CoreGui n.KeyCode=n.KeyCode or Enum.
KeyCode.Q v(n.Title)n.isMobile=n.isMobile or false if n.CustomTheme then n.CustomTheme.defaultTab=n.CustomTheme.
defaultTab or j.defaultTab n.CustomTheme.background=n.CustomTheme.background or j.background n.CustomTheme.
secondaryBackground=n.CustomTheme.secondaryBackground or j.secondaryBackground n.CustomTheme.tertiaryBackground=n.
CustomTheme.tertiaryBackground or j.tertiaryBackground n.CustomTheme.text=n.CustomTheme.text or j.text n.CustomTheme.
image=n.CustomTheme.image or j.image n.CustomTheme.placeholder=n.CustomTheme.placeholder or j.placeholder n.CustomTheme.
close=n.CustomTheme.close or j.close k.create(n.CustomTheme)end if n.Size then n.Size.X=n.Size.X or 550 n.Size.Y=n.Size.
Y or 400 if n.Size.X<550 then n.Size.X=550 print'Size.X was too small! >550 required'end if n.Size.Y<400 then n.Size.Y=
400 print'Size.Y was too small! >400 required'end elseif not n.Size then n.Size={}n.Size.X=550 n.Size.Y=400 end if n.
Parent:FindFirstChild(u[n.Title])then n.Parent:FindFirstChild(u[n.Title]):Destroy()end local w,x if n.isMobile then w,x=
o{Title=n.Title,Parent=n.Parent,KeyCode=n.KeyCode,saltedTable=u}else w,x=p{Title=n.Title,Parent=n.Parent,Size=n.Size,
KeyCode=n.KeyCode,saltedTable=u}end h(r):onChange(function()x(i(r))end)l.Windows={}function l.Windows.Tab(y,z)local A=g(
z.tabColor or k.get'defaultTab')v(z.Name)local B=q('Window',i(w.windowsRef),{Name=z.Name,saltedTable=u})local C=q('Tab',
i(w.sideBarRef),{Name=z.Name,tabColor=i(A),Image=z.Image,saltedTable=u,Callback=function(C)r:set(C)i(w.uipagelayoutRef):
JumpTo(B)s:set(u[z.Name])end})h(s):onChange(function()C(i(s)==u[z.Name])end)if i(t)then t:set(false)s:set(u[z.Name])end
l.Windows.Component={}function l.Windows.Component.Button(D,E)return q('Button',B,{Name=E.Name,tabColor=i(A),Callback=E.
Callback})end function l.Windows.Component.Toggle(D,E)return q('Toggle',B,{tabColor=i(A),Name=E.Name,Default=E.Default,
Callback=E.Callback})end function l.Windows.Component.TextBox(D,E)return q('TextBox',B,{tabColor=i(A),Name=E.Name,
Default=E.Default,OnLeave=E.OnLeave,OnlyNumbers=E.OnlyNumbers,Callback=E.Callback})end function l.Windows.Component.
Keybind(D,E)return q('Keybind',B,{Name=E.Name,tabColor=i(A),Default=E.Default,Callback=E.Callback})end function l.
Windows.Component.Dropdown(D,E)return q('Dropdown',B,{Name=E.Name,Items=E.Items,Default=E.Default,Multiselect=E.
Multiselect,tabColor=i(A),Callback=E.Callback})end function l.Windows.Component.Slider(D,E)return q('Slider',B,{Name=E.
Name,tabColor=i(A),Min=E.Min,Max=E.Max,Placement=E.Placement,InitialValue=E.InitialValue,Callback=E.Callback})end
function l.Windows.Component.Section(D,E:string)return q('Section',B,{Text=E})end function l.Windows.Component.Paragraph
(D,E)return q('Paragraph',B,{Title=E.Title,Body=E.Body})end function l.Windows.Component.Label(D,E:string)return q(
'Label',B,{tabColor=i(A),Text=E})end function l.Windows.Component.Group(D,E)local F,G=q('Group',B,{Name=E.Name,Icon=E.
Icon,tabColor=i(A)})function G.Button(H,I)return q('Button',F,{Name=I.Name,tabColor=i(A),Callback=I.Callback})end
function G.Toggle(H,I)return q('Toggle',F,{tabColor=i(A),Name=I.Name,Default=I.Default,Callback=I.Callback})end function
G.TextBox(H,I)return q('TextBox',F,{tabColor=i(A),Name=I.Name,Default=I.Default,OnLeave=I.OnLeave,OnlyNumbers=I.
OnlyNumbers,Callback=I.Callback})end function G.Keybind(H,I)return q('Keybind',F,{Name=I.Name,tabColor=i(A),Default=I.
Default,Callback=I.Callback})end function G.Dropdown(H,I)return q('Dropdown',F,{Name=I.Name,Items=I.Items,Default=I.
Default,Multiselect=I.Multiselect,tabColor=i(A),Callback=I.Callback})end function G.Slider(H,I)return q('Slider',F,{Name
=I.Name,tabColor=i(A),Min=I.Min,Max=I.Max,Step=I.Step,InitialValue=I.InitialValue,Callback=I.Callback})end function G.
Section(H,I:string)return q('Section',F,{Text=I})end function G.Paragraph(H,I)return q('Paragraph',F,{Title=I.Title,Body
=I.Body})end function G.Label(H,I:string)return q('Label',F,{tabColor=i(A),Text=I})end function G.ColorPicker(H,I)return
q('ColorPicker',F,{tabColor=i(A),Name=I.Name,Color=I.Color,Callback=I.Callback})end return G end function l.Windows.
Component.ColorPicker(D,E)return q('ColorPicker',B,{tabColor=i(A),Name=E.Name,Color=E.Color,Callback=E.Callback})end
return l.Windows.Component end function l.SetCustomTheme(y,z)z.defaultTab=z.defaultTab or j.defaultTab z.background=z.
background or j.background z.secondaryBackground=z.secondaryBackground or j.secondaryBackground z.tertiaryBackground=z.
tertiaryBackground or j.tertiaryBackground z.text=z.text or j.text z.image=z.image or j.image z.placeholder=z.
placeholder or j.placeholder z.close=z.close or j.close k.create(z)end function l.Destroy(y)n.Parent:FindFirstChild(u[n.
Title]):Destroy()end function l.Windows.Notify(y,z)return q('Notification',i(w.notificationListRef),{Title=z.Title,
Duration=z.Duration,Body=z.Body})end return l.Windows end return l end)()end,[3]=function()local b,c,d=a(3)local e
return(function(...)local f,g=d(c.PubTypes),d(c.Utility.restrictRead)export type StateObject<T> =PubTypes.StateObject<T>
export type CanBeState<T> =PubTypes.CanBeState<T>export type Symbol=PubTypes.Symbol export type Value<T> =PubTypes.Value
<T>export type Computed<T> =PubTypes.Computed<T>export type ForPairs<KO,VO> =PubTypes.ForPairs<KO,VO>export type ForKeys
<KI,KO> =PubTypes.ForKeys<KI,KO>export type ForValues<VI,VO> =PubTypes.ForKeys<VI,VO>export type Observer=PubTypes.
Observer export type Tween<T> =PubTypes.Tween<T>export type Spring<T> =PubTypes.Spring<T>type Fusion={version:PubTypes.
Version,New:(className:string)->((propertyTable:PubTypes.PropertyTable)->Instance),Hydrate:(target:Instance)->((
propertyTable:PubTypes.PropertyTable)->Instance),Ref:PubTypes.SpecialKey,Cleanup:PubTypes.SpecialKey,Children:PubTypes.
SpecialKey,Out:PubTypes.SpecialKey,OnEvent:(eventName:string)->PubTypes.SpecialKey,OnChange:(propertyName:string)->
PubTypes.SpecialKey,Value:<T>(initialValue:T)->Value<T>,Computed:<T>(callback:()->T,destructor:((T)->())?)->Computed<T>,
ForPairs:<KI,VI,KO,VO,M>(inputTable:CanBeState<{[KI]:VI}>,processor:(KI,VI)->(KO,VO,M?),destructor:((KO,VO,M?)->())?)->
ForPairs<KO,VO>,ForKeys:<KI,KO,M>(inputTable:CanBeState<{[KI]:any}>,processor:(KI)->(KO,M?),destructor:((KO,M?)->())?)->
ForKeys<KO,any>,ForValues:<VI,VO,M>(inputTable:CanBeState<{[any]:VI}>,processor:(VI)->(VO,M?),destructor:((VO,M?)->())?
)->ForValues<any,VO>,Observer:(watchedState:StateObject<any>)->Observer,Tween:<T>(goalState:StateObject<T>,tweenInfo:
TweenInfo?)->Tween<T>,Spring:<T>(goalState:StateObject<T>,speed:number?,damping:number?)->Spring<T>,cleanup:(...any)->()
,doNothing:(...any)->()}return g('Fusion',{version={major=0,minor=2,isRelease=true},New=d(c.Instances.New),Hydrate=d(c.
Instances.Hydrate),Ref=d(c.Instances.Ref),Out=d(c.Instances.Out),Cleanup=d(c.Instances.Cleanup),Children=d(c.Instances.
Children),OnEvent=d(c.Instances.OnEvent),OnChange=d(c.Instances.OnChange),Value=d(c.State.Value),Computed=d(c.State.
Computed),ForPairs=d(c.State.ForPairs),ForKeys=d(c.State.ForKeys),ForValues=d(c.State.ForValues),Observer=d(c.State.
Observer),Tween=d(c.Animation.Tween),Spring=d(c.Animation.Spring),cleanup=d(c.Utility.cleanup),doNothing=d(c.Utility.
doNothing)})::Fusion end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)local f=c.Parent.Parent local g
,h,i,j,k,l,m,n,o,p,q,r=d(f.PubTypes),d(f.Types),d(f.Logging.logError),d(f.Logging.logErrorNonFatal),d(f.Animation.
unpackType),d(f.Animation.SpringScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.
Dependencies.updateAll),d(f.Utility.xtypeof),d(f.State.unwrap),{}local s,t={__index=r},{__mode='k'}function r.get(u,v:
boolean?):any if v~=false then m(u)end return u._currentValue end function r.setPosition(u,v:PubTypes.Animatable)local w
=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end u._springPositions=k(v,w)u.
_currentValue=v l.add(u)o(u)end function r.setVelocity(u,v:PubTypes.Animatable)local w=typeof(v)if w~=u._currentType
then i('springTypeMismatch',nil,w,u._currentType)end u._springVelocities=k(v,w)l.add(u)end function r.addVelocity(u,v:
PubTypes.Animatable)local w=typeof(v)if w~=u._currentType then i('springTypeMismatch',nil,w,u._currentType)end local x=
k(v,w)for y,z in ipairs(x)do u._springVelocities[y]+=z end l.add(u)end function r.update(u):boolean local v=u._goalState
:get(false)if v==u._goalValue then local w=q(u._damping)if typeof(w)~='number'then j('mistypedSpringDamping',nil,typeof(
w))elseif w<0 then j('invalidSpringDamping',nil,w)else u._currentDamping=w end local x=q(u._speed)if typeof(x)~='number'
then j('mistypedSpringSpeed',nil,typeof(x))elseif x<0 then j('invalidSpringSpeed',nil,x)else u._currentSpeed=x end
return false else u._goalValue=v local w,x=u._currentType,typeof(v)u._currentType=x local y=k(v,x)local z=#y u.
_springGoals=y if x~=w then u._currentValue=u._goalValue local A,B=table.create(z,0),table.create(z,0)for C,D in ipairs(
y)do A[C]=D end u._springPositions=A u._springVelocities=B l.remove(u)return true elseif z==0 then u._currentValue=u.
_goalValue return true else l.add(u)return false end end end local function u<T>(v:PubTypes.Value<T>,w:PubTypes.
CanBeState<number>?,x:PubTypes.CanBeState<number>?):Types.Spring<T>if w==nil then w=10 end if x==nil then x=1 end local
y={[v]=true}if p(w)=='State'then y[w]=true end if p(x)=='State'then y[x]=true end local z=setmetatable({type='State',
kind='Spring',dependencySet=y,dependentSet=setmetatable({},t),_speed=w,_damping=x,_goalState=v,_goalValue=nil,
_currentType=nil,_currentValue=nil,_currentSpeed=q(w),_currentDamping=q(x),_springPositions=nil,_springGoals=nil,
_springVelocities=nil},s)n(z)v.dependentSet[z]=true z:update()return z end return u end)()end,[6]=function()local b,c,d=
a(6)local e return(function(...)local f,g=game:GetService'RunService',c.Parent.Parent local h,i,j,k=d(g.Types),d(g.
Animation.packType),d(g.Animation.springCoefficients),d(g.Dependencies.updateAll)type Set<T> ={[T]:any}type Spring=Types
.Spring<any>local l,m,n:Set<Spring>,o={},0.0001,{},os.clock()function l.add(p:Spring)p._lastSchedule=o p.
_startDisplacements={}p._startVelocities={}for q,r in ipairs(p._springGoals)do p._startDisplacements[q]=p.
_springPositions[q]-r p._startVelocities[q]=p._springVelocities[q]end n[p]=true end function l.remove(p:Spring)n[p]=nil
end local function p()local q:Set<Spring> ={}o=os.clock()for r in pairs(n)do local s,t,u,v=j(o-r._lastSchedule,r.
_currentDamping,r._currentSpeed)local w,x,y,z,A=r._springPositions,r._springVelocities,r._startDisplacements,r.
_startVelocities,false for B,C in ipairs(r._springGoals)do local D,E=y[B],z[B]local F,G=D*s+E*t,D*u+E*v if math.abs(F)>m
or math.abs(G)>m then A=true end w[B]=F+C x[B]=G end if not A then q[r]=true end end for s in pairs(n)do s._currentValue
=i(s._springPositions,s._currentType)k(s)end for t in pairs(q)do n[t]=nil end end f:BindToRenderStep(
'__FusionSpringScheduler',Enum.RenderPriority.First.Value,p)return l end)()end,[7]=function()local b,c,d=a(7)local e
return(function(...)local f=c.Parent.Parent local g,h,i,j,k,l,m,n,o=d(f.PubTypes),d(f.Types),d(f.Animation.
TweenScheduler),d(f.Dependencies.useDependency),d(f.Dependencies.initDependency),d(f.Logging.logError),d(f.Logging.
logErrorNonFatal),d(f.Utility.xtypeof),{}local p,q={__index=o},{__mode='k'}function o.get(t,u:boolean?):any if u~=false
then j(t)end return t._currentValue end function o.update(t):boolean local u=t._goalState:get(false)if u==t._nextValue
and not t._currentlyAnimating then return false end local v=t._tweenInfo if t._tweenInfoIsState then v=v:get()end if
typeof(v)~='TweenInfo'then m('mistypedTweenInfo',nil,typeof(v))return false end t._prevValue=t._currentValue t.
_nextValue=u t._currentTweenStartTime=os.clock()t._currentTweenInfo=v local w=v.DelayTime+v.Time if v.Reverses then w+=v
.Time end w*=v.RepeatCount+1 t._currentTweenDuration=w i.add(t)return false end local function t<T>(u:PubTypes.
StateObject<PubTypes.Animatable>,v:PubTypes.CanBeState<TweenInfo>?):Types.Tween<T>local w=u:get(false)if v==nil then v=
TweenInfo.new()end local x,y={[u]=true},n(v)=='State'if y then x[v]=true end local z=v if y then z=z:get()end if typeof(
z)~='TweenInfo'then l('mistypedTweenInfo',nil,typeof(z))end local A=setmetatable({type='State',kind='Tween',
dependencySet=x,dependentSet=setmetatable({},q),_goalState=u,_tweenInfo=v,_tweenInfoIsState=y,_prevValue=w,_nextValue=w,
_currentValue=w,_currentTweenInfo=v,_currentTweenDuration=0,_currentTweenStartTime=0,_currentlyAnimating=false},p)k(A)u.
dependentSet[A]=true return A end return t end)()end,[8]=function()local b,c,d=a(8)local e return(function(...)local f,g
=game:GetService'RunService',c.Parent.Parent local h,i,j,k,l=d(g.Types),d(g.Animation.lerpType),d(g.Animation.
getTweenRatio),d(g.Dependencies.updateAll),{}type Set<T> ={[T]:any}type Tween=Types.Tween<any>local m,n:Set<Tween> ={
__mode='k'},{}setmetatable(n,m)function l.add(o:Tween)n[o]=true end function l.remove(o:Tween)n[o]=nil end
local function o()local p=os.clock()for q:Tween in pairs(n::any)do local t=p-q._currentTweenStartTime if t>q.
_currentTweenDuration then if q._currentTweenInfo.Reverses then q._currentValue=q._prevValue else q._currentValue=q.
_nextValue end q._currentlyAnimating=false k(q)l.remove(q)else local u=j(q._currentTweenInfo,t)local v=i(q._prevValue,q.
_nextValue,u)q._currentValue=v q._currentlyAnimating=true k(q)end end end f:BindToRenderStep('__FusionTweenScheduler',
Enum.RenderPriority.First.Value,o)return l end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f=
game:GetService'TweenService'local function g(h:TweenInfo,i:number):number local j,k,l,m,n,o=h.DelayTime,h.Time,h.
Reverses,1+h.RepeatCount,h.EasingStyle,h.EasingDirection local p=j+k if l then p+=k end if i>=p*m then return 1 end
local q=i%p if q<=j then return 0 end local t=(q-j)/k if t>1 then t=2-t end local u=f:GetValue(t,n,o)return u end return
g end)()end,[10]=function()local b,c,d=a(10)local e return(function(...)local f=c.Parent.Parent local g,h=d(f.PubTypes),
d(f.Colour.Oklab)local function i(j:any,k:any,l:number):any local m=typeof(j)if typeof(k)==m then if m=='number'then
local n,o=k::number,j::number return(n-o)*l+o elseif m=='CFrame'then local n,o=k::CFrame,j::CFrame return o:Lerp(n,l)
elseif m=='Color3'then local n,o=k::Color3,j::Color3 local p,q=h.to(o),h.to(n)return h.from(p:Lerp(q,l),false)elseif m==
'ColorSequenceKeypoint'then local n,o=k::ColorSequenceKeypoint,j::ColorSequenceKeypoint local p,q=h.to(o.Value),h.to(n.
Value)return ColorSequenceKeypoint.new((n.Time-o.Time)*l+o.Time,h.from(p:Lerp(q,l),false))elseif m=='DateTime'then local
n,o=k::DateTime,j::DateTime return DateTime.fromUnixTimestampMillis((n.UnixTimestampMillis-o.UnixTimestampMillis)*l+o.
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
return{lock='rbxassetid://10723434711',dropdown='rbxassetid://15555233897',chevron='rbxassetid://10709790948',emptyBox=
'rbxassetid://15555208034',filledBox='rbxassetid://15555206993',maximize='rbxassetid://15556636376',minimize=
'rbxassetid://15556637715',close='rbxassetid://10747384394'}end)()end,[69]=function()local b,c,d=a(69)local e return(
function(...)local f,g,h={},d(c.Parent.Fusion),d(c.themes)local i,j,k,l=g.Value,g.Observer,d(c.Parent.Parent.utilities.
get),{}local m=i{}j(m):onChange(function()for p,q in ipairs(l)do task.spawn(q)end end)function f.set(p)for q,t in
ipairs(h)do if t.name==p then m:set(t)break end end end local p={defaultTab='Color3',background='Color3',
secondaryBackground='Color3',tertiaryBackground='Color3',text='Color3',image='Color3',placeholder='Color3',close=
'Color3'}function f.create(q)for t,u in p do if q[t]==nil then error('Missing value "'..tostring(t)..'"')end if typeof(q
[t])~='Color3'then error(t.." isn't type Color3")end end for v,E in q do if p[v]==nil then warn(
'Incorrect value removed "'..tostring(v)..'"')q[v]=nil end end m:set(q)end function f.get(q)local u=k(m)if u[q]then
return u[q]else error(q.." isn't a theme element")end end m:set(h[1])function f.onChange(q)table.insert(l,q)end return f
end)()end,[70]=function()local b,c,d=a(70)local e return(function(...)return{{defaultTab=Color3.fromHex'#a49ae6',
background=Color3.fromRGB(40,44,50),secondaryBackground=Color3.fromRGB(49,56,66),tertiaryBackground=Color3.fromRGB(57,63
,75),text=Color3.fromRGB(220,221,225),image=Color3.fromRGB(220,221,225),placeholder=Color3.fromRGB(165,166,169),close=
Color3.fromRGB(190,100,105)}}end)()end,[71]=function()local b,c,d=a(71)local e return(function(...)local f={}function f.
create(g,h,i)local j,k=Instance.new(g),i or{}for l,m in pairs(h)do j[l]=m end for p,q in pairs(k)do q.Parent=j end
return j end function f.c(g,h,i,j)local k,l=Instance.new(h),j or{}for m,p in pairs(i)do k[m]=p end for q,u in pairs(l)do
u.Parent=k end return k end function f.tween(g)if not g.r then g.r=0 end if not g.d then g.d='InOut'end if not g.s then
g.s='Linear'end if not g.t then g.t=1 end if not g.a or not g.o then return warn
[[

UI-UTILITIES ERROR: 
Missing one of the required propertoes: a, o]]elseif g.a and g.o then local h,i=game:GetService
'TweenService',TweenInfo.new(g.t,Enum.EasingStyle[g.s],Enum.EasingDirection[g.d],g.r)local j=h:Create(g.o,i,g.a)return j
end end function f.gtween(g)if not g.r then g.r=0 end if not g.d then g.d='InOut'end if not g.s then g.s='Linear'end if
not g.t then g.t=1 end if not g.a or not g.o then return warn
[[

UI-UTILITIES ERROR: 
Missing one of the required propertoes: a, o]]elseif g.a and g.o then local h,i=game:GetService
'TweenService',TweenInfo.new(g.t,Enum.EasingStyle[g.s],Enum.EasingDirection[g.d],g.r)for j,k in next,g.o do h:Create(k,i
,g.a):Play()end end end function f.drag(g,h)h=h or 10 local i,j,k,l,m,p,q,u,v=game:GetService'UserInputService',(game:
GetService'RunService'),g local function E(F,G,H)return F+(G-F)*H end local F=(h)local function G(H)if not(v)then return
end if not(l)and(p)then k.Position=UDim2.new(v.X.Scale,E(k.Position.X.Offset,p.X.Offset,H*F),v.Y.Scale,E(k.Position.Y.
Offset,p.Y.Offset,H*F))return end local I=(m-i:GetMouseLocation())local K,L=(v.X.Offset-I.X),(v.Y.Offset-I.Y)p=UDim2.
new(v.X.Scale,K,v.Y.Scale,L)k.Position=UDim2.new(v.X.Scale,E(k.Position.X.Offset,K,H*F),v.Y.Scale,E(k.Position.Y.Offset,
L,H*F))end k.InputBegan:Connect(function(H)if H.UserInputType==Enum.UserInputType.MouseButton1 or H.UserInputType==Enum.
UserInputType.Touch then l=true u=H.Position v=k.Position m=i:GetMouseLocation()H.Changed:Connect(function()if H.
UserInputState==Enum.UserInputState.End then l=false end end)end end)k.InputChanged:Connect(function(H)if H.
UserInputType==Enum.UserInputType.MouseMovement or H.UserInputType==Enum.UserInputType.Touch then q=H end end)local H=j.
Heartbeat:Connect(G)return H end return f end)()end,[73]=function()local b,c,d=a(73)local e return(function(...)local f=
c.Parent.Parent local g=d(f.Bundles.Fusion)local h,i,j,k,l,m,p,q,u,v=g.New,g.OnEvent,g.Children,g.Value,g.Computed,d(f.
utilities.get),d(f.Bundles.themeSystem),d(f.utilities.animate),d(f.utilities.matchColors),d(f.Bundles.icons)return
function(E)assert(E.Name,'Button needs a Name')assert(E.Callback,'Button needs a Callback')local F,G=k(E.Parent),k(E.
tabColor)if u(m(G),p.get'defaultTab')then G:set(p.get'defaultTab')end local H,I,K,L,M,N=k(E.Name),k(E.Callback),k(false)
,k(false),k'',{}local O=h'TextButton'{Interactable=l(function()return not m(L)end),ZIndex=2,Size=UDim2.new(1,0,0,40),
AutoButtonColor=false,Parent=m(F),BackgroundColor3=q(function()return p.get'secondaryBackground'end,40,1),[i
'MouseButton1Down']=function()K:set(true)end,[i'MouseButton1Up']=function()K:set(false)end,[i'MouseLeave']=function()K:
set(false)end,[i'MouseButton1Click']=function()task.spawn(m(I))end,[j]={{h'Frame'{ZIndex=3,Visible=l(function()return m(
L)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,BackgroundColor3=q(function()return p.get
'tertiaryBackground'end,40,1),[j]={h'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=
UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=q(function()return p.get'image'end,40,1),Image=v.lock},h
'TextLabel'{Text=l(function()return m(M)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.
new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=q(function()return p.get'text'end,40,1),
TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[j]={h'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}},h'UICorner'{CornerRadius=UDim.new(0,6)}}}},h'UICorner'{CornerRadius=UDim.new(0,6)},h'Frame'{ZIndex=2,
Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundColor3=q(function()
return m(G)end,40,1),BackgroundTransparency=q(function()if m(K)then return 0.95 end return 0.85 end,50,1),[j]={h
'UICorner'{CornerRadius=UDim.new(0,6)}}},h'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-20,0,14),AnchorPoint=
Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,TextColor3=q(function()return p.get'text'end,40,1),Text=l(function()return m(H)end),TextTransparency
=q(function()if m(K)then return 0.35 end return 0 end,50,1),[j]={h'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}
}}function N.Remove(P)O:Destroy()end function N.SetName(P,Q)if typeof(Q)=='string'then H:set(Q)else error(
'You didnt give '..m(H)..' a string for SetName')end end function N.SetCallback(P,Q)if typeof(Q)=='function'then I:set(Q
)else error('You didnt give '..m(H)..' a function for SetCallback')end end function N.Lock(P,Q)L:set(true)M:set(Q or
'Locked')end function N.Unlock(P)L:set(false)end return N end end)()end,[74]=function()local b,c,d=a(74)local e return(
function(...)local f=c.Parent.Parent local g=d(f.Bundles.Fusion)local h,i,j,k,l,m,p,q,u,v,E=g.New,g.OnEvent,g.Children,g
.Value,g.Computed,g.Observer,d(f.utilities.get),d(f.Bundles.themeSystem),d(f.utilities.animate),d(f.utilities.
matchColors),d(f.Bundles.icons)cloneref=cloneref or function(F)return F end local F,G=cloneref(game:GetService
'UserInputService'),cloneref(game:GetService'RunService')return function(H)assert(H.Name,'ColorPicker needs Name')
assert(H.Color,'ColorPicker needs Color')assert(H.Callback,'ColorPicker needs Callback')local I,K=k(H.Parent),k(H.
tabColor)if v(p(K),q.get'defaultTab')then K:set(q.get'defaultTab')end local L,M,N,O,P=k(H.Name),k(H.Color),k(H.Callback)
,k(false),k''local Q=p(M)local R,S,T=Q:ToHSV()local U,V,W=k(R),k(S),k(T)local function X()return Color3.fromHSV(p(U),p(V
),p(W))end local function Y(Z,_,aa)local ab,ac,ad if typeof(Z)=='Color3'then ab,ac,ad=Z:ToHSV()else ab,ac,ad=Color3.new(
Z,_,aa):ToHSV()end U:set(ab)V:set(ac)W:set(ad)task.spawn(p(N),X())end local function aa(ab,ac)local ad=1 for Z=1,ab do
ad=ad*10 end return math.round(ac*ad)/ad end local ab,ac,ad,Z,_,ae,af,ag=k(false),k(false),k(false),k(false),(k(false))
ag=h'TextButton'{ClipsDescendants=true,Interactable=l(function()return not p(O)end),ZIndex=2,Parent=p(I),Size=u(function
()if p(ab)then return UDim2.new(1,0,0,160)end return UDim2.new(1,0,0,40)end,50,1),BackgroundColor3=u(function()return q.
get'secondaryBackground'end,40,1),[i'MouseButton1Click']=function()ab:set(not p(ab))end,[i'Destroying']=function()if ae
then ae:Disconnect()end end,[j]={{{h'Frame'{ZIndex=4,Visible=l(function()return p(O)end),Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.1,BackgroundColor3=u(function()return q.get'tertiaryBackground'end,40,1),[j]={h'ImageLabel'{
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=u(function()return q.get'image'end,40,1),Image=E.lock},h'TextLabel'{Text=l(function()return p(P)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=u(function()return q.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[j]={h'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},h'UICorner'{CornerRadius=UDim.new(
0,6)}}}},h'UICorner'{CornerRadius=UDim.new(0,6)},h'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundColor3=u(function()return p(K)end,40,1),BackgroundTransparency=0.85,[j]={
h'UICorner'{CornerRadius=UDim.new(0,6)}}},h'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-45,0,14),AnchorPoint=
Vector2.new(0,0),Position=UDim2.new(0,10,0,13),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=0,TextColor3=u(function()return q.get'text'end,40,1),Text=p(L),[j]={h
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},h'ImageLabel'{ZIndex=3,AnchorPoint=Vector2.new(1,0),Position=
UDim2.new(1,-7,0,8),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image='rbxassetid://16898730641',
ImageRectOffset=Vector2.new(257,257),ImageRectSize=Vector2.new(256,256),ImageColor3=l(function()return Color3.fromHSV(p(
U),p(V),p(W))end)}},h'Frame'{ClipsDescendants=true,Position=UDim2.fromOffset(10,40),Size=UDim2.new(1,-20,0,110),
BackgroundTransparency=1,ZIndex=3,[j]={h'UIListLayout'{Padding=UDim.new(0,10),SortOrder=Enum.SortOrder.LayoutOrder,
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.
VerticalAlignment.Center},h'TextBox'{Name='HexTextBox',Size=UDim2.fromOffset(145,110),BackgroundColor3=u(function()
return q.get'background'end,40,1),BackgroundTransparency=0.3,Text=l(function()return'#'..X():ToHex()end),TextColor3=u(
function()return X()end,40,1),TextSize=20,Font=Enum.Font.GothamMedium,[i'FocusLost']=function()local ah=ag:
FindFirstChild('HexTextBox',true).Text:gsub('[^%w#]','')if not string.find(ah,'#')then ah='#'..ah end if string.len(ah)
~=7 then warn('Hex code malformed',ah)ag:FindFirstChild('HexTextBox',true).Text='#'..X():ToHex()else local ai,aj=pcall(
function()return Color3.fromHex(ah)end)if tostring(aj)=='Unable to convert characters to hex value'then warn(
'Hex code malformed',ah)ag:FindFirstChild('HexTextBox',true).Text='#'..X():ToHex()else Y(Color3.fromHex(ah))end end end,
[j]={h'UICorner'{CornerRadius=UDim.new(0,4)}}},h'Frame'{Name='HSVTextBoxes',Size=UDim2.fromOffset(55,110),
BackgroundColor3=u(function()return q.get'background'end,40,1),BackgroundTransparency=0.3,[j]={h'UICorner'{CornerRadius=
UDim.new(0,4)},h'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.
FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center},h'TextLabel'{Text='H',TextColor3=u(function(
)return p(K)end,40,1),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},h'TextBox'{Name
='HText',TextColor3=u(function()return q.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=l(
function()return tostring(aa(2,p(U)))end),Size=UDim2.fromOffset(55,14),[i'Changed']=function(ah)local ai=tonumber(ag:
FindFirstChild('HText',true).Text)if ah:lower()=='text'and ai then if ai>1 or ai<0 then warn
'Your H value was outside of [0,1] so we clamped it!'ai=math.clamp(ai,0,1)end if aa(2,p(U))~=ai then U:set(ai)end ag:
FindFirstChild('HText',true).Text=tostring(aa(2,p(U)))end end,[i'FocusLost']=function()local ah=tonumber(ag:
FindFirstChild('HText',true).Text)if not ah then warn'H needs to be a number'ag:FindFirstChild('HText',true).Text=
tostring(aa(2,p(U)))end end},h'TextLabel'{Text='S',TextColor3=u(function()return p(K)end,40,1),Font=Enum.Font.
GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},h'TextBox'{Name='SText',TextColor3=u(function()
return q.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=l(function()return tostring(aa(2,p(V)))
end),Size=UDim2.fromOffset(55,14),[i'Changed']=function(ah)local ai=tonumber(ag:FindFirstChild('SText',true).Text)if ah:
lower()=='text'and ai then if ai>1 or ai<0 then warn'Your S value was outside of [0,1] so we clamped it!'ai=math.clamp(
ai,0,1)end if aa(2,p(V))~=ai then V:set(ai)end ag:FindFirstChild('SText',true).Text=tostring(aa(2,p(V)))end end,[i
'FocusLost']=function()local ah=tonumber(ag:FindFirstChild('SText',true).Text)if not ah then warn
'S needs to be a number'ag:FindFirstChild('SText',true).Text=tostring(aa(2,p(V)))end end},h'TextLabel'{Text='V',
TextColor3=u(function()return p(K)end,40,1),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(
55,14)},h'TextBox'{Name='VText',TextColor3=u(function()return q.get'text'end,40,1),Font=Enum.Font.Gotham,
BackgroundTransparency=1,Text=l(function()return tostring(aa(2,p(W)))end),Size=UDim2.fromOffset(55,14),[i'Changed']=
function(ah)local ai=tonumber(ag:FindFirstChild('VText',true).Text)if ah:lower()=='text'and ai then if ai>1 or ai<0 then
warn'Your V value was outside of [0,1] so we clamped it!'ai=math.clamp(ai,0,1)end if aa(2,p(W))~=ai then W:set(ai)end ag
:FindFirstChild('VText',true).Text=tostring(aa(2,p(W)))end end,[i'FocusLost']=function()local ah=tonumber(ag:
FindFirstChild('VText',true).Text)if not ah then warn'V needs to be a number'ag:FindFirstChild('VText',true).Text=
tostring(aa(2,p(W)))end end}}},h'Frame'{Name='RGBTextBoxes',Size=UDim2.fromOffset(55,110),BackgroundColor3=u(function()
return q.get'background'end,40,1),BackgroundTransparency=0.3,[j]={h'UICorner'{CornerRadius=UDim.new(0,4)},h
'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Vertical,
HorizontalAlignment=Enum.HorizontalAlignment.Center},h'TextLabel'{Text='R',TextColor3=Color3.fromRGB(200,0,0),Font=Enum.
Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},h'TextBox'{Name='RText',TextColor3=u(function()
return q.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1,Text=l(function()return tostring(math.round(
X().R*255))end),Size=UDim2.fromOffset(55,14),[i'FocusLost']=function()local ah,ai=tonumber(ag:FindFirstChild('RText',
true).Text),X()if ah then if math.clamp(math.round(ai.R*255),0,255)~=ah then Y(ah/255,ai.G,ai.B)end else print(ah,
'needs to be a number')ag:FindFirstChild('RText',true).Text=tostring(math.round(ai.R*255))end end},h'TextLabel'{Text='G'
,TextColor3=Color3.fromRGB(0,200,0),Font=Enum.Font.GothamMedium,BackgroundTransparency=1,Size=UDim2.fromOffset(55,14)},h
'TextBox'{Name='GText',TextColor3=u(function()return q.get'text'end,40,1),Font=Enum.Font.Gotham,BackgroundTransparency=1
,Text=l(function()return tostring(math.round(X().G*255))end),Size=UDim2.fromOffset(55,14),[i'FocusLost']=function()local
ah,ai=tonumber(ag:FindFirstChild('GText',true).Text),X()if ah then if math.clamp(math.round(ai.G*255),0,255)~=ah then Y(
ai.R,ah/255,ai.B)end else print'G needs to be a number'ag:FindFirstChild('GText',true).Text=tostring(math.round(ai.G*255
))end end},h'TextLabel'{Text='B',TextColor3=Color3.fromRGB(0,0,125),Font=Enum.Font.GothamMedium,BackgroundTransparency=1
,Size=UDim2.fromOffset(55,14)},h'TextBox'{Name='BText',TextColor3=u(function()return q.get'text'end,40,1),Font=Enum.Font
.Gotham,BackgroundTransparency=1,Text=l(function()return tostring(math.round(X().B*255))end),Size=UDim2.fromOffset(55,14
),[i'FocusLost']=function()local ah,ai=tonumber(ag:FindFirstChild('BText',true).Text),X()if ah then if math.clamp(math.
round(ai.B*255),0,255)~=ah then Y(ai.R,ai.G,ah/255)end else print'B needs to be a number'ag:FindFirstChild('BText',true)
.Text=tostring(math.round(ai.B*255))end end}}},h'TextButton'{ZIndex=2,Name='SVPicker',ClipsDescendants=true,Size=UDim2.
fromOffset(110,110),[i'MouseLeave']=function()ac:set(true)end,[i'MouseEnter']=function()ac:set(false)end,[i'InputBegan']
=function(ah)if ah.UserInputType==Enum.UserInputType.MouseButton1 then ad:set(true)local ai ai=ah.Changed:Connect(
function()if ah.UserInputState==Enum.UserInputState.End then ad:set(false)ai:Disconnect()end end)end end,[j]={h
'UIGradient'{Color=l(function()return ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,255,255)),
ColorSequenceKeypoint.new(1,Color3.fromHSV(p(U),1,1))}end)},h'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.fromScale(0.5,0),Size=UDim2.fromScale(1,2),BackgroundTransparency=1,Image='rbxassetid://13611892279'},h'Frame'{
ZIndex=2,Name='dot',AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=l(function()local ah if p(U)>0.95 or p(U)<=0.05
then ah=0.5 elseif p(U)<0.56 and p(U)>0.45 then ah=1 else if p(U)+1>1 then ah=1-p(U)else ah=1+p(U)end end return Color3.
fromHSV(ah,1,1)end),Size=UDim2.fromOffset(4,4),Position=l(function()return UDim2.fromScale(p(V),1-p(W))end)}}},h
'TextButton'{ZIndex=2,Name='HPicker',Size=UDim2.fromOffset(55,110),[i'MouseLeave']=function()Z:set(true)end,[i
'MouseEnter']=function()Z:set(false)end,[i'InputBegan']=function(ah)if ah.UserInputType==Enum.UserInputType.MouseButton1
then _:set(true)local ai ai=ah.Changed:Connect(function()if ah.UserInputState==Enum.UserInputState.End then _:set(false)
ai:Disconnect()end end)end end,[j]={h'UIGradient'{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3
.fromHSV(1,1,1)),ColorSequenceKeypoint.new(0.1,Color3.fromHSV(0.9,1,1)),ColorSequenceKeypoint.new(0.2,Color3.fromHSV(0.8
,1,1)),ColorSequenceKeypoint.new(0.3,Color3.fromHSV(0.7,1,1)),ColorSequenceKeypoint.new(0.4,Color3.fromHSV(0.6,1,1)),
ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),ColorSequenceKeypoint.new(0.6,Color3.fromHSV(0.4,1,1)),
ColorSequenceKeypoint.new(0.7,Color3.fromHSV(0.3,1,1)),ColorSequenceKeypoint.new(0.8,Color3.fromHSV(0.2,1,1)),
ColorSequenceKeypoint.new(0.9,Color3.fromHSV(0.1,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(0,1,1))}},h'Frame'{
Name='slide',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.new(1,0,0,2),Position=l(function()return UDim2.fromScale(0,1-p(U)
)end)}}}}}}}m(ad):onChange(function()if p(ad)then ae=G.Heartbeat:Connect(function()local ah=F:GetMouseLocation()local ai
=(ah-ag:FindFirstChild('SVPicker',true).AbsolutePosition)if p(ac)then if ai.X>110 then ai=Vector2.new(110,ai.Y)elseif ai
.X<0 then ai=Vector2.new(0,ai.Y)end if ai.Y>110 then ai=Vector2.new(ai.X,110)elseif ai.Y<0 then ai=Vector2.new(ai.X,0)
end end V:set(ai.X/110)W:set((110-ai.Y)/110)end)else if ae then ae:Disconnect()end end end)m(_):onChange(function()if p(
_)then af=G.Heartbeat:Connect(function()local ah=F:GetMouseLocation()local ai=(ah-ag:FindFirstChild('HPicker',true).
AbsolutePosition)if p(Z)then if ai.Y>110 then ai=Vector2.new(ai.X,110)elseif ai.Y<0 then ai=Vector2.new(ai.X,0)end end U
:set((110-ai.Y)/110)end)else if af then af:Disconnect()end end end)m(U):onChange(function()task.spawn(p(N),X())end)m(V):
onChange(function()task.spawn(p(N),X())end)m(W):onChange(function()task.spawn(p(N),X())end)local ah={}function ah.Lock(
ai,aj)O:set(true)ab:set(false)P:set(aj or'Locked')end function ah.Unlock(ai)O:set(false)end function ah.Remove(ai)ag:
Destroy()end function ah.SetColor(ai,aj)Y(aj)end return ah end end)()end,[75]=function()local aa,ab,ac=a(75)local ad
return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,b,c,d,e,f,g,h,i,j=af.New,
af.OnEvent,af.Children,af.Value,af.Computed,af.Ref,af.Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.
utilities.animate),ac(ae.utilities.matchColors),ac(ae.Bundles.icons),ac(ae.Bundles.betterMathModule)return function(k)
assert(k.Name,'Dropdown needs a Name')assert(k.Items,'Dropdown needs an Items')assert(k.Callback,
'Dropdown needs a Callback')local l,m=aj(k.Parent),aj(k.tabColor)if h(e(m),f.get'defaultTab')then m:set(f.get
'defaultTab')end local p,q,u,v,E,F,G=aj(k.Default),aj(k.Name),aj(k.Multiselect or false),aj(k.Items),aj(k.Callback),aj{}
,{}local H,I,K,L,M,N,O,P,Q,R,S,T=aj(e(q)),aj(0),aj'',aj(),aj(),aj(false),aj(false),aj'',{},aj(false),aj'',aj(false)local
U=ag'Frame'{ClipsDescendants=true,Parent=e(l),Name=e(H),BackgroundColor3=g(function()return f.get'secondaryBackground'
end,40,1),Size=g(function()if e(O)then return UDim2.new(1,0,0,174)end return UDim2.new(1,0,0,40)end,50,1),[ai]={{ag
'UICorner'{CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=2,Size=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(0.5,0),
Position=UDim2.fromScale(0.5,0),BackgroundColor3=g(function()return e(m)end,40,1),BackgroundTransparency=g(function()if
e(N)then return 0.95 end return 0.85 end,50,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{
BackgroundTransparency=1,Size=UDim2.new(1,-45,0,14),AnchorPoint=Vector2.new(0,0),Position=UDim2.new(0,10,0,13),Font=Enum
.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Text=b(function()return e(q)end),
TextColor3=g(function()return f.get'text'end,40,1),TextTransparency=g(function()if e(N)then return 0.35 end return 0 end
,50,1),[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag'ImageLabel'{Name='icon',AnchorPoint=Vector2.
new(1,0),Position=UDim2.new(1,-5,0,6),Size=UDim2.fromOffset(28,28),BackgroundTransparency=1,Image=i.dropdown,ImageColor3
=g(function()return f.get'image'end,40,1),ImageTransparency=g(function()if e(N)then return 0.35 end return 0 end,50,1)},
{ag'Frame'{ZIndex=3,Visible=b(function()return e(R)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,
BackgroundColor3=g(function()return f.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0,
0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=g(function()return f
.get'image'end,40,1),Image=i.lock},ag'TextLabel'{Text=b(function()return e(S)end),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=
g(function()return f.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.new(0,6)}}}}},ag'TextButton'{
Interactable=b(function()return not e(R)end),Size=UDim2.new(1,0,0,40),BackgroundTransparency=1,AnchorPoint=Vector2.new(
0.5,0),Position=UDim2.fromScale(0.5,0),[ah'MouseButton1Down']=function()N:set(true)end,[ah'MouseButton1Up']=function()N:
set(false)end,[ah'MouseLeave']=function()N:set(false)end,[ah'MouseButton1Click']=function()O:set(not e(O))end},ag
'TextBox'{Name='searchBox',Size=UDim2.new(1,-16,0,28),Position=UDim2.new(0.5,0,0,40),Text='',AnchorPoint=Vector2.new(0.5
,0),PlaceholderText='Search',Font=Enum.Font.GothamMedium,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
BackgroundColor3=g(function()return e(m)end,40,1),TextColor3=g(function()return f.get'text'end,40,1),PlaceholderColor3=
g(function()return f.get'placeholder'end,40,1),BackgroundTransparency=g(function()if e(N)then return 0.95 end return 0.8
end,50,1),TextTransparency=g(function()if e(N)then return 0.35 end return 0 end,50,1),[ah'Changed']=function(U)if U==
'Text'then local V,W=e(M),e(L)P:set(string.lower(V.Text))if e(P)~=''then for X,Y in ipairs(W:GetChildren())do if e(P)==
''then break end if Y:IsA'TextButton'then local Z=j.String:JaroWinklerDistance{e(P),Y.Name}if Z<0.45 then Y.Visible=true
else Y.Visible=false end end task.wait()end else for X,Y in ipairs(W:GetChildren())do if Y:IsA'TextButton'then Y.Visible
=true end end end end end,[c]=M,[ai]={{ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'UIPadding'{PaddingLeft=UDim.new(0,10)
}}}},ag'ScrollingFrame'{Name='Items',Size=UDim2.new(1,0,0,94),BackgroundTransparency=1,ScrollBarThickness=2,Position=
UDim2.new(0.5,0,0,72),AnchorPoint=Vector2.new(0.5,0),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.
AutomaticSize.Y,ScrollBarImageColor3=g(function()return e(m)end,40,1),[c]=L,[ai]={ag'UIListLayout'{Padding=UDim.new(0,2)
,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder}}}}}d(F):onChange(function()q:
set(e(H))I:set(0)table.clear(Q)table.clear(G)if U:FindFirstChild('Items',true)then for V,W in ipairs(U:FindFirstChild(
'Items',true):GetChildren())do if W:IsA'TextButton'then W:Destroy()end end table.clear(G)end for V,W in ipairs(e(F))do
local X,Y=aj(false),aj(false)d(Y):onChange(function()if e(u)then if e(Y)then I:set(e(I)+1)else I:set(e(I)-1)end q:set(e(
H)..': '..tostring(e(I))..'/'..tostring(#e(v)))else q:set(e(H)..': '..e(K))end end)d(K):onChange(function()if not e(u)
then if e(K)==W then Y:set(true)else Y:set(false)end end end)ag'TextButton'{Size=UDim2.new(0.95,0,0,30),Name=W,Parent=e(
L),BackgroundColor3=g(function()return f.get'text'end,40,1),BackgroundTransparency=g(function()if e(X)then return 0.95
end return 1 end,50,1),[ah'MouseEnter']=function()X:set(true)end,[ah'MouseLeave']=function()X:set(false)end,[ah
'MouseButton1Click']=function()if e(u)then if e(Y)then Y:set(false)table.remove(G,table.find(G,W))else Y:set(true)table.
insert(G,W)end task.spawn(e(E),G)else O:set(false)K:set(W)task.spawn(e(E),e(K))end end,[ai]={ag'UICorner'{CornerRadius=
UDim.new(0,6)},ag'TextLabel'{Size=UDim2.new(1,0,0,12),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),Font=Enum.Font.Gotham,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Text=W,
TextColor3=g(function()if e(u)then if e(Y)and not e(X)then return Color3.fromRGB(85,220,135)elseif e(Y)and e(X)then
return Color3.fromRGB(190,100,105)else return f.get'text'end end return f.get'text'end,30,1),TextTransparency=g(function
()if e(N)then return 0.35 end return 0 end,50,1),[ai]={ag'UIPadding'{PaddingLeft=UDim.new(0,20)}}}}}if typeof(e(p))==
'table'and e(u)then for Z,_ in ipairs(e(p))do if _==W then Y:set(true)table.insert(G,W)end end elseif typeof(e(p))==
'string'then if e(p)==W then if e(u)then Y:set(true)table.insert(G,W)else K:set(e(p))task.spawn(e(E),e(K))end end end Q[
W]=function(Z)Y:set(Z)end end if e(u)and#G>0 then task.spawn(e(E),G)end end)F:set(e(v))local V={}function V.Remove(W)U:
Destroy()end function V.SetItems(W,X)if typeof(X)=='table'then F:set(X)else error("You didn't give "..e(H)..
' a table for SetItems')end end function V.SelectItem(W,X)if not e(u)then if typeof(X)=='string'then local Y=false for Z
,_ in ipairs(e(F))do if _==X then Y=true end end if Y then K:set(X)for ak,al in ipairs(Q)do al(false)end Q[X](true)task.
spawn(e(E),e(K))else error(X.." isn't in your Item table")end else error('You tried to pass a '..typeof(X)..
' as a string for SelectItem')end else error(e(H)..' is multiselectable. Use SelectItems')end end function V.SelectItems
(ak,al)if e(u)then if typeof(al)=='table'then local W={}for X,Y in ipairs(al)do if table.find(e(F),Y)then table.insert(W
,Y)else warn(Y.." isn't in the Items table")end end task.wait()for Z,_ in ipairs(W)do Q[_](true)end task.spawn(e(E),W)G=
W else error('You tried to pass a '..typeof(al)..' as a table for SelectItems')end else error(e(H)..
" isn't multiselectable. Use SelectItems")end end function V.Lock(ak,al)R:set(true)T:set(e(O))S:set(al or'Locked')O:set(
false)end function V.Unlock(ak)R:set(false)O:set(e(T))end return V end end)()end,[76]=function()local aa,ab,ac=a(76)
local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e=af.
New,af.OnEvent,af.Children,af.Value,af.Computed,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate)
,ac(ae.utilities.matchColors),ac(ae.Bundles.icons)return function(f)assert(f.Name,'Group needs a Name')local g,h=aj(f.
Parent),aj(f.tabColor)if d(al(h),b.get'defaultTab')then h:set(b.get'defaultTab')end local i,j,k,l,m,p,q,u=aj(f.Name),aj(
f.Icon or''),aj(40),aj(false),aj(false),aj(false),aj'',aj(false)local v=ag'TextButton'{ZIndex=2,Parent=al(g),
ClipsDescendants=true,Size=ak(function()if al(l)then return UDim2.new(1,0,0,40)end return UDim2.new(1,0,0,al(k))end),
BackgroundTransparency=c(function()if al(l)then return 0 end return 1 end,30,1),BackgroundColor3=c(function()if al(l)
then return b.get'secondaryBackground'end return b.get'background'end,30,1),[ah'MouseButton1Click']=function()l:set(not
al(l))end,[ai]={{ag'Frame'{ZIndex=3,Name='Lock',Visible=ak(function()return al(m)end),Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.1,BackgroundColor3=c(function()return b.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=c(function()return b.get'image'end,40,1),Image=e.lock},ag'TextLabel'{Text=ak(function()return al(q)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=c(function()return b.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.
new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'TextLabel'{Text=ak(function()return al(i)end),TextColor3=c(
function()if al(l)then return b.get'text'end return al(h)end,40,1),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,
Size=ak(function()if al(u)then return UDim2.new(1,-54,0,16)end return UDim2.new(1,-20,0,16)end),TextSize=16,Position=ak(
function()if al(u)then return UDim2.fromOffset(44,12)end return UDim2.fromOffset(10,12)end),AnchorPoint=Vector2.new(0,0)
,TextXAlignment=Enum.TextXAlignment.Left},ag'ImageLabel'{Visible=ak(function()if al(u)then return true end return false
end),BackgroundTransparency=1,ImageColor3=c(function()return b.get'image'end,40,1),Image=ak(function()if al(u)then
return al(j)end return''end),Size=UDim2.fromOffset(24,24),Position=UDim2.fromOffset(10,8)},ag'Frame'{
BackgroundTransparency=1,Size=UDim2.fromOffset(24,24),Position=UDim2.new(1,-34,0,8),[ai]={ag'ImageLabel'{AnchorPoint=
Vector2.new(0.5,0.5),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),ImageColor3=c(
function()if al(l)then return b.get'image'end return al(h)end,40,1),Image=e.chevron,Rotation=c(function()if al(l)then
return 0 end return 180 end,30,1)}}},ag'Frame'{Name='componentHolder',Size=ak(function()return UDim2.new(1,0,0,al(k)-40)
end),Position=UDim2.fromOffset(0,40),BackgroundTransparency=1,[ah'ChildAdded']=function(v)if typeof(v)=='Instance'and
not v:IsA'UIListLayout'then local E=v.AbsoluteSize.Y k:set(al(k)+v.AbsoluteSize.Y+5)v.Changed:Connect(function(F)if F:
lower()=='absolutesize'then if E~=math.round(v.AbsoluteSize.Y)then k:set(al(k)-E+math.round(v.AbsoluteSize.Y))E=math.
round(v.AbsoluteSize.Y)end end end)end end,[ai]={ag'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.
LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Top},ag'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,5)}}}}}if
al(j)~=''then u:set(true)end local E={}function E.SetName(F,G)if typeof(G)=='string'then i:set(G)else error(
'You entered a '..typeof(G)..' instead of a string')end end function E.SetIcon(F,G)if typeof(G)=='string'then j:set(G)
else error('You entered a '..typeof(G)..' instead of a string')end end function E.Lock(F,G)m:set(true)p:set(al(l))l:set(
true)q:set(G or'Locked')end function E.Unlock(F)m:set(false)l:set(al(p))end return v.componentHolder,E end end)()end,[77
]=function()local aa,ab,ac=a(77)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)
local ag,ah,ai,aj,ak,al,b,c,d,e,f,g=af.New,af.OnEvent,af.Children,af.Value,af.Computed,af.Ref,ac(ae.utilities.get),ac(ae
.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.matchColors),ac(ae.Bundles.icons),game:GetService
'UserInputService'return function(h)assert(h.Name,'Keybind needs a Name')assert(h.Default,'Keybind needs a Default')
assert(h.Callback,'Keybind needs a Callback')local i,j=aj(h.Parent),aj(h.tabColor)if e(b(j),c.get'defaultTab')then j:
set(c.get'defaultTab')end local k,l,m,p,q,u,v,E=aj(h.Name),aj(h.Callback),aj(string.upper(h.Default)),aj(),aj(false),aj(
false),aj'',{}local F,G=(ag'TextButton'{Interactable=ak(function()return not b(u)end),Size=UDim2.new(1,0,0,40),
BackgroundColor3=d(function()return c.get'secondaryBackground'end,40,1),Parent=b(i),[ah'MouseButton1Click']=function()
local F=b(p)F:CaptureFocus()end,[ai]={{{ag'Frame'{ZIndex=4,Visible=ak(function()return b(u)end),Size=UDim2.fromScale(1,1
),BackgroundTransparency=0.1,BackgroundColor3=d(function()return c.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'
{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=d(function()return c.get'image'end,40,1),Image=f.lock},ag'TextLabel'{Text=ak(function()return b(v)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=d(function()return c.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.
new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=0.85,BackgroundColor3=d(function()return b(j)end,40,
1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-60,0,14),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,Text=b(k),TextColor3=d(function()return c.get'text'end,40,1),
[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag'Frame'{ZIndex=3,Size=UDim2.new(0,30,0,24),AnchorPoint=
Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=0.25,BackgroundColor3=d(function()return c.get
'secondaryBackground'end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'TextBox'{Interactable=ak(function()
return not b(u)end),ZIndex=3,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),Size=UDim2.new(0,30,0,12),
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Center,PlaceholderText='. . .',Font=Enum.Font.Gotham,
TextSize=12,PlaceholderColor3=d(function()return c.get'placeholder'end,40,1),TextColor3=d(function()if b(q)then return c
.get'text'end return b(j)end,50,1),Text=ak(function()return b(m)end),[ah'Focused']=function()q:set(true)m:set''end,[ah
'FocusLost']=function()q:set(false)end,[al]=p}}})G=g.InputBegan:Connect(function(H,I)if b(q)then if H.KeyCode~=Enum.
KeyCode.Unknown then local K=string.split(tostring(H.KeyCode),'.')m:set(K[3])b(p):ReleaseFocus()end elseif not I and(b(m
)~='')and(H.KeyCode==Enum.KeyCode[b(m)])and F then if not b(u)then task.spawn(b(l))end end end)F.Destroying:Connect(
function()G:Disconnect()end)function E.Remove(H)F:Destroy()end function E.SetBind(H,I:string)if typeof(I)=='string'then
m:set(string.upper(I))else error('you didnt give '..b(k)..' a string for SetBind!')end end function E.Lock(H,I)u:set(
true)v:set(I or'Locked')end function E.Unlock(H)u:set(false)end return E end end)()end,[78]=function()local aa,ab,ac=a(
78)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d=af
.New,af.Children,af.Value,af.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),ac(ae.Bundles.themeSystem),ac(ae.
utilities.lerpColor),ac(ae.utilities.matchColors)return function(e)assert(e.Text,'Label needs literally a string')local
f,g,h=ai(e.Parent),ai(e.Text),ai(e.tabColor)if d(ak(h),b.get'defaultTab')then h:set(b.get'defaultTab')end local i,j={},
ag'Frame'{Size=UDim2.new(1,0,0,30),Parent=ak(f),BackgroundColor3=al(function()return b.get'secondaryBackground'end,40,1)
,[ah]={ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'TextLabel'{ZIndex=2,Font=Enum.Font.GothamMedium,TextSize=14,RichText=
true,TextScaled=true,BackgroundTransparency=1,Size=UDim2.new(1,-20,0,14),Position=UDim2.new(0,10,0.5,0),AnchorPoint=
Vector2.new(0,0.5),TextXAlignment=Enum.TextXAlignment.Left,TextColor3=al(function()return c(ak(h),'white',0.5)end,40,1),
Text=aj(function()return ak(g)end),[ah]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}}}function i.Remove(k)j
:Destroy()end function i.SetText(k,l)if typeof(l)=='string'then g:set(l)else error('you didnt give '..ak(g)..
' a string for SetText!')end end return i end end)()end,[79]=function()local aa,ab,ac=a(79)local ad return(function(...)
local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e=af.New,af.OnEvent,af.Children,af
.Value,af.Computed,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.tween),ac(ae
.utilities.getStringBounds)local function f(g,h)local i=1 for j=1,g do i=i*10 end local j=tostring(math.round(h*i)/i)
local k=string.split(j,'.')if#k==1 then local l=''for m=1,g do l=l..'0'end j=j..'.'..l end return j end return function(
g)assert(g.Title,'Notify needs a Title')assert(g.Body,'Notfiy needs a Body')assert(g.Duration,'Notify needs a Duration')
local h,i,j,k,l,m,p,q,u=aj(g.Parent),aj(g.Title),aj(g.Body),aj(g.Duration),aj(e(g.Body,{TextSize=13,Font=Enum.Font.
Gotham,VectorSize=Vector2.new(230,1000)}).Y),aj(false),aj(false),(aj'')u=ag'Frame'{AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,Parent=al(h),Size=c(function()if al(m)then task.delay(0.4,function()p:set(true)end)return UDim2
.fromOffset(230,25+al(l)+15)end return UDim2.fromOffset(230,0)end,20,1),[ai]={ag'TextButton'{AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=0,BackgroundColor3=c(function()return b.get'background'end,40,1),Size=ak(function()return
UDim2.fromOffset(230,25+al(l)+15)end),Position=c(function()if al(p)then return UDim2.fromScale(0,0.5)end return UDim2.
fromScale(1.2,0.5)end,30,1),[ah'MouseButton1Click']=function()p:set(false)task.wait(0.4)m:set(false)task.wait(2)u:
Destroy()end,[ai]={ag'UICorner'{CornerRadius=UDim.new(0,4)},ag'TextLabel'{Name='Title',Size=UDim2.new(1,-5,0,18),
Position=UDim2.new(0,5,0,5),BackgroundTransparency=1,Font=Enum.Font.GothamMedium,TextXAlignment=Enum.TextXAlignment.Left
,TextSize=18,TextColor3=c(function()return b.get'text'end,40,1),Text=al(i)},ag'TextLabel'{Name='Body',Size=UDim2.new(1,-
8,0,al(l)),Position=UDim2.fromOffset(8,25),BackgroundTransparency=1,Font=Enum.Font.Gotham,TextSize=13,TextXAlignment=
Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextTransparency=0.2,TextWrapped=true,TextColor3=c(
function()return b.get'text'end,40,1),Text=al(j)},ag'TextLabel'{Size=UDim2.fromOffset(100,10),AnchorPoint=Vector2.new(1,
1),Position=UDim2.new(1,-5,1,-5),Text=ak(function()return al(q)end),TextColor3=c(function()return b.get'text'end,40,1),
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Right},ag'Frame'{Name='timer',ZIndex=0,AnchorPoint=Vector2.
new(0,1),Position=UDim2.fromScale(0,1),BackgroundColor3=c(function()return b.get'text'end,40,1),Size=d(function()if al(p
)then return UDim2.new(1,0,0,10)end return UDim2.new(0,0,0,10)end,TweenInfo.new(al(k),Enum.EasingStyle.Linear)),[ai]={ag
'UICorner'{CornerRadius=UDim.new(0,4)},ag'Frame'{AnchorPoint=Vector2.new(0.5,0),Size=UDim2.fromScale(1,0.6),Position=
UDim2.fromScale(0.5,0),BackgroundColor3=c(function()return b.get'background'end,40,1)}}}}}}}task.spawn(function()repeat
task.wait()until al(p)local v,E=(tick())repeat E=tick()-v q:set(f(1,math.clamp(E,0,al(k))))task.wait()until E>al(k)end)
task.spawn(function()task.wait()m:set(true)repeat task.wait()until al(p)task.wait(al(k))p:set(false)task.wait(0.4)m:set(
false)task.wait(2)u:Destroy()end)end end)()end,[80]=function()local aa,ab,ac=a(80)local ad return(function(...)local ae=
ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e=af.New,af.Children,af.Value,af.Computed,
af.Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.getStringBounds),
ac(ae.utilities.lerpColor)return function(f)assert(f.Title,'Paragraph needs a Title')assert(f.Body,
'Paragrap needs a Body')local g,h,i=ai(f.Parent),ai(f.Title),ai(f.Body)local j=ai(d(al(i),{Font=Enum.Font.Gotham,
VectorSize=Vector2.new(math.round(al(g).AbsoluteSize.X),1000),TextSize=12}).Y)al(g).Changed:Connect(function(k)if k:
lower()=='absolutesize'then j:set(d(al(i),{Font=Enum.Font.Gotham,VectorSize=Vector2.new(math.round(al(g).AbsoluteSize.X)
,1000),TextSize=12}).Y)end end)ak(i):onChange(function()j:set(d(al(i),{Font=Enum.Font.Gotham,VectorSize=Vector2.new(math
.round(al(g).AbsoluteSize.X),1000),TextSize=12}).Y)end)local k,l={},ag'Frame'{BackgroundColor3=c(function()return b.get
'secondaryBackground'end,40,1),Parent=al(g),Size=aj(function()return UDim2.new(1,0,0,36+al(j))end),[ah]={ag'UICorner'{
CornerRadius=UDim.new(0,4)},ag'UIPadding'{PaddingTop=UDim.new(0,10),PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,
10)},ag'TextLabel'{Name='Title',RichText=true,Position=UDim2.fromScale(0,0),Size=UDim2.new(1,0,0,16),
BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,TextScaled=true,
TextSize=16,Font=Enum.Font.GothamMedium,TextColor3=c(function()return b.get'text'end,40,1),Text=aj(function()return al(h
)end),[ah]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'TextLabel'{Name='Body',TextWrapped=true,RichText
=true,Position=UDim2.fromOffset(4,16),BackgroundTransparency=1,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=
Enum.TextYAlignment.Top,TextSize=12,Font=Enum.Font.Gotham,TextColor3=c(function()return e(b.get'text','black',0.1)end,40
,1),Text=aj(function()return al(i)end),Size=aj(function()return UDim2.new(1,-4,0,al(j))end)}}}function k.Remove(m)l:
Destroy()end function k.SetBody(m,p)if typeof(p)=='string'then i:set(p)else error('you didnt give '..al(h)..
' a string for SetBody!')end end function k.SetTitle(m,p)if typeof(p)=='string'then h:set(p)else error('you didnt give '
..al(h)..' a string for SetTitle!')end end return k end end)()end,[81]=function()local aa,ab,ac=a(81)local ad return(
function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b=af.New,af.Children,af.
Value,af.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),ac(ae.Bundles.themeSystem)return function(c)assert(c.
Text,'Section needs literally a string')local d,e,f=ai(c.Parent),ai(c.Text),{}local g=ag'Frame'{Size=UDim2.new(1,0,0,30)
,BackgroundTransparency=1,Parent=ak(d),[ah]={ag'TextLabel'{Size=UDim2.new(1,0,0,15),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,5,0.5,0),BackgroundTransparency=1,TextScaled=true,Font=Enum.Font.GothamMedium,TextXAlignment=Enum.
TextXAlignment.Left,TextColor3=al(function()return b.get'text'end,40,1),Text=aj(function()return ak(e)end),[ah]={ag
'UITextSizeConstraint'{MaxTextSize=15,MinTextSize=1}}}}}function f.Remove(h)g:Destroy()end function f.SetText(h,i)if
typeof(i)=='string'then e:set(i)else error('you didnt give '..ak(e)..' a string for SetText!')end end return f end end)(
)end,[82]=function()local aa,ab,ac=a(82)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.
Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e,f,g,h,i=af.New,af.OnEvent,af.Children,af.Value,af.Computed,af.Ref,af.Observer,ac(
ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.matchColors),ac(ae.Bundles.icons),
game:GetService'UserInputService',game:GetService'RunService'return function(j)assert(j.Name,'Slider needs a Name')
assert(j.Max,'Slider needs a Max')assert(j.Min,'Slider needs a Min')assert(j.Callback,'Slider needs a Callback')local k,
l=aj(j.Parent),aj(j.tabColor)if f(c(l),d.get'defaultTab')then l:set(d.get'defaultTab')end local m,p,q,u,v=aj(j.Name),aj(
j.Callback),aj(j.Max),aj(j.Min),aj(j.Placement or 0)local E,F,G,H,I,K,L=aj(j.InitialValue or c(u)),aj(),aj(),aj(false),
aj(false),aj(false),aj''local function M(N)if c(v)==0 then return math.floor(N)end return tonumber(string.format('%.'..
c(v)..'f',N))end local function N(O,P,Q,R,S)return(1-((O-P)/(Q-P)))*R+((O-P)/(Q-P))*S end local function O(P)return M(N(
P,0,180,c(u),c(q)))end local P,Q=aj(0),aj(c(u))b(Q):onChange(function()P:set(N(c(Q),c(u),c(q),0,1))if not c(K)then task.
spawn(c(p),c(Q))end end)Q:set(c(E))if c(E)<c(u)or c(E)>c(q)then warn('InitialValue for '..c(m)..
' is either too big or too small! InitialValue = '..tostring(c(u)))E:set(c(u))end h.InputEnded:Connect(function(R)if R.
UserInputType==Enum.UserInputType.MouseButton1 and c(I)then I:set(false)end end)local R,S=ag'Frame'{Size=UDim2.new(1,0,0
,40),ClipsDescendants=true,BackgroundColor3=e(function()return d.get'secondaryBackground'end,40,1),Parent=c(k),[ah
'MouseEnter']=function()H:set(true)end,[ah'MouseLeave']=function()H:set(false)end,[ai]={{{ag'Frame'{ZIndex=4,Visible=ak(
function()return c(K)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,BackgroundColor3=e(function()return d.get
'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=
UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=e(function()return d.get'image'end,40,1),Image=g.lock},ag
'TextLabel'{Text=ak(function()return c(L)end),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.
new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=e(function()return d.get'text'end,40,1),
TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,
MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=
2,Size=UDim2.fromScale(1,1),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.fromScale(0.5,0),BackgroundTransparency=0.85,
BackgroundColor3=e(function()return c(l)end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{
BackgroundTransparency=1,Size=UDim2.new(1,-220,0,14),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=
Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,TextColor3=e(
function()return d.get'text'end,40,1),Text=c(m),[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}},ag
'CanvasGroup'{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundColor3=e(function()return d.get
'image'end,40,1),Size=e(function()if c(H)and not c(K)then return UDim2.fromOffset(180,16)end return UDim2.fromOffset(180
,4)end,40,1),[ai]={ag'UICorner'{CornerRadius=e(function()if c(H)then return UDim.new(0,4)end return UDim.new(0,6)end,40,
1)},ag'TextButton'{Interactable=ak(function()return not c(K)end),AnchorPoint=Vector2.new(0.5,0.5),Size=UDim2.fromScale(1
,1),Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,[ah'MouseButton1Down']=function()I:set(true)end,[ah
'InputBegan']=function(R)if R.UserInputType==Enum.UserInputType.MouseButton1 then local S,T=h:GetMouseLocation().X,c(F).
Size.X.Offset local U=S-(c(F).AbsolutePosition.X+T)while c(I)and not c(K)and task.wait()do local V=h:GetMouseLocation().
X local W=math.clamp(T+(V-S)+U,0,180)Q:set(O(W))i.RenderStepped:Wait()end end end,[al]=G,[ai]={ag'Frame'{Name=
'ChangeThing',AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),BackgroundColor3=e(function()return c(l)end
,40,1),Size=e(function()return UDim2.fromScale(c(P),1)end,60,1),[al]=F}}}}},ag'TextLabel'{AnchorPoint=Vector2.new(1,0.5)
,Size=UDim2.fromOffset(20,14),Position=UDim2.new(1,-195,0.5,0),BackgroundTransparency=1,Text=ak(function()return
tostring(c(Q))end),TextColor3=e(function()return d.get'text'end,40,1),Font=Enum.Font.Gotham,TextSize=14,TextXAlignment=
Enum.TextXAlignment.Right,TextScaled=true,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}}}},{}function S.
Remove(T)R:Destroy()end function S.SetValue(T,U)if typeof(U)=='number'and(U<=c(q))and(U>=c(u))then Q:set(U)elseif
typeof(U)~='number'then error("You didn't give "..c(m)..' a number for SetValue')else error('Your SetValue for '..c(m)..
' is great or smaller than the maximum or minimum')end end function S.SetMin(T,U)if typeof(U)=='number'and(U<c(q))then u
:set(U)local V=c(G)V.ChangeThing.ZIndex=2 V.ChangeThing.ZIndex=1 elseif typeof(U)~='number'then error("You didn't give "
..c(m)..' a number for SetMin')else error('Your SetMin for '..c(m)..' is great than the maximum')end end function S.
SetMax(T,U)if typeof(U)=='number'and(U<c(u))then q:set(U)local V=c(G)V.ChangeThing.ZIndex=2 V.ChangeThing.ZIndex=1
elseif typeof(U)~='number'then error("You didn't give "..c(m)..' a number for SetMax')else error('Your SetMax for '..c(m
)..' is smaller than the minimum')end end function S.Lock(T,U)K:set(true)L:set(U or'Locked')end function S.Unlock(T)K:
set(false)end return S end end)()end,[83]=function()local aa,ab,ac=a(83)local ad return(function(...)local ae=ab.Parent.
Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e,f=af.New,af.OnEvent,af.Children,af.Value,af.Ref,af.
Observer,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.getStringBounds),ac(ae.utilities.animate),ac(ae
.utilities.matchColors)return function(g)assert(g.Name,'Tab needs a Name')local h,i=aj(g.Parent),aj(g.tabColor)if f(b(i)
,c.get'defaultTab')then i:set(c.get'defaultTab')end local j,k,l,m=aj(g.Name),aj(g.Callback),aj(g.saltedTable),aj(false)
al(m):onChange(function()if b(m)then task.spawn(b(k),b(i))end end)local p,q,u=aj(false),aj(0),aj()do local v=d(b(j),{
TextSize=14,Font=Enum.Font.GothamMedium,VectorSize=Vector2.new(10000,14)})if v.X<449 then q:set(math.abs(v.X))else for E
=1,14 do local F=d(b(j),{TextSize=14-E,Font=Enum.Font.GothamMedium,VectorSize=Vector2.new(450,40)})if F.X<450 and F.Y<14
then q:set(math.abs(F.X+1))break end end end end ag'TextButton'{ZIndex=5,Name=b(l)[b(j)],Parent=b(h),AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.fromOffset(30,30),BackgroundColor3=e(function()return c.get'secondaryBackground'end,40,1),
ClipsDescendants=true,Text='',Size=e(function()if b(p)then return UDim2.fromOffset(b(q)+50,40)else return UDim2.
fromOffset(40,40)end end,20,1),[ah'MouseEnter']=function()p:set(true)end,[ah'MouseLeave']=function()p:set(false)end,[ah
'MouseButton1Click']=function()b(k)(b(i))end,[ai]={ag'UICorner'{CornerRadius=e(function()if b(p)then return UDim.new(0,
10)else return UDim.new(1,0)end end,30,1)},ag'ImageLabel'{ZIndex=5,Name='icon',AnchorPoint=Vector2.new(0,0.5),Position=
UDim2.new(0,6,0.5,0),Size=UDim2.fromOffset(28,28),BackgroundTransparency=1,Image=g.Image,ImageColor3=e(function()if b(p)
and not b(m)then return b(i)elseif not b(p)and not b(m)then return c.get'image'else return b(i)end end,30,1)},ag
'TextLabel'{ZIndex=5,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(0,b(q),0,14),
BackgroundTransparency=1,Text=g.Name,TextScaled=true,TextTransparency=e(function()if b(p)then return 0 end return 1 end,
20,1),Font=Enum.Font.GothamMedium,TextColor3=e(function()return c.get'text'end,40,1),TextXAlignment=Enum.TextXAlignment.
Left,[ak]=u,[ai]={ag'UITextSizeConstraint'{MaxTextSize=14,MinTextSize=1}}}}}return function(v)m:set(v)return b(i)end end
end)()end,[84]=function()local aa,ab,ac=a(84)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.
Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e,f,g=af.New,af.OnEvent,af.Children,af.Value,af.Computed,af.Ref,af.Observer
,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.matchColors),ac(ae.Bundles.
icons)return function(h)assert(h.Name,'TextBox needs a Name')assert(h.Callback,'ColorPicker needs Callback')local i,j=
aj(h.Parent),aj(h.tabColor)if f(c(j),d.get'defaultTab')then j:set(d.get'defaultTab')end local k,l,m,p,q,u,v,E,F,G=aj(h.
Name),aj(h.Callback),aj(h.Default or''),aj(h.OnlyNumbers or false),aj(h.OnLeave or false),aj(),aj'',aj(false),aj(false),
aj''local H=aj(c(v))b(v):onChange(function()if c(p)then if tonumber(c(v))or c(v)==''then H:set(c(v))end else H:set(c(v))
end local I=c(u)I.Text=c(H)end)if c(q)then b(E):onChange(function()if not c(E)then if c(p)then if tonumber(c(v))then
task.spawn(c(l),c(v))end else task.spawn(c(l),c(v))end end end)else b(v):onChange(function()if c(p)then if tonumber(c(v)
)then task.spawn(c(l),c(v))end else task.spawn(c(l),c(v))end end)end if c(m)~=''then v:set(c(m))end local I,K=ag
'TextButton'{Parent=c(i),Interactable=ak(function()return not c(F)end),Size=UDim2.new(1,0,0,40),BackgroundColor3=e(
function()return d.get'secondaryBackground'end,40,1),[ah'MouseButton1Click']=function()local I=c(u)I:CaptureFocus()end,[
ai]={{{ag'Frame'{ZIndex=4,Visible=ak(function()return c(F)end),Size=UDim2.fromScale(1,1),BackgroundTransparency=0.1,
BackgroundColor3=e(function()return d.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0,
0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,ImageColor3=e(function()return d
.get'image'end,40,1),Image=g.lock},ag'TextLabel'{Text=ak(function()return c(G)end),AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,BackgroundTransparency=1,TextColor3=
e(function()return d.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,[ai]={ag
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'UICorner'{
CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.
new(0.5,0,0.5,0),BackgroundTransparency=0.85,BackgroundColor3=e(function()return c(j)end,40,1),[ai]={ag'UICorner'{
CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-185,0,14),AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,TextTransparency=0,Text=c(k),TextColor3=e(function()return d.get'text'end,40,1),[ai]={ag
'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag'Frame'{ZIndex=3,Size=UDim2.new(0,160,0,24),AnchorPoint=Vector2
.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),BackgroundTransparency=0.25,BackgroundColor3=e(function()return d.get
'secondaryBackground'end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}}},ag'TextBox'{Interactable=ak(function()
return not c(F)end),ZIndex=3,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-10,0.5,0),Size=UDim2.new(0,160,0,24),
BackgroundTransparency=1,TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,PlaceholderText='Input Here',Font=Enum.
Font.Gotham,TextSize=12,PlaceholderColor3=e(function()return d.get'placeholder'end,40,1),Text=ak(function()if c(m)~=''
then return c(m)end return''end),TextColor3=e(function()if c(E)then return d.get'text'else return c(j)end end,50,1),[ah
'Focused']=function()E:set(true)end,[ah'FocusLost']=function()E:set(false)end,[ah'Changed']=function(I)if I=='Text'then
local K=c(u)v:set(K.Text)end end,[al]=u,[ai]={ag'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,5)},ag
'UITextSizeConstraint'{MaxTextSize=12,MinTextSize=1}}}}},{}function K.Remove(L)I:Destroy()end function K.SetInput(L,M)if
typeof(M)=='string'then c(u).Text=M else error("You didn't give "..c(k)..' a string for setInput')end end function K.
Lock(L,M)F:set(true)G:set(M or'Locked')end function K.Unlock(L)F:set(false)end return K end end)()end,[85]=function()
local aa,ab,ac=a(85)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,
aj,ak,al,b,c,d,e,f=af.New,af.OnEvent,af.Children,af.Value,af.Computed,af.Observer,ac(ae.utilities.get),ac(ae.Bundles.
themeSystem),ac(ae.utilities.animate),ac(ae.utilities.matchColors),ac(ae.Bundles.icons)return function(g)assert(g.Name,
'Toggle needs a Name')assert(g.Callback,'Toggle needs a Callback')local h,i=aj(g.Parent),aj(g.tabColor)if e(b(i),c.get
'defaultTab')then i:set(c.get'defaultTab')end local j,k,l,m,p,q=aj(g.Name),aj(g.Callback),aj(g.Default or false),aj(
false),aj(false),aj''al(m):onChange(function()if not b(p)then task.spawn(b(k),b(m))end end)m:set(b(l))local u,v=ag
'TextButton'{Interactable=ak(function()return not b(p)end),Size=UDim2.new(1,0,0,40),AutoButtonColor=false,
BackgroundColor3=d(function()return c.get'secondaryBackground'end,40,1),Parent=b(h),[ah'MouseButton1Click']=function()m:
set(not b(m))end,[ai]={{ag'Frame'{ZIndex=3,Visible=ak(function()return b(p)end),Size=UDim2.fromScale(1,1),
BackgroundTransparency=0.1,BackgroundColor3=d(function()return c.get'tertiaryBackground'end,40,1),[ai]={ag'ImageLabel'{
AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(24,24),Position=UDim2.new(0,10,0.5),BackgroundTransparency=1,
ImageColor3=d(function()return c.get'image'end,40,1),Image=f.lock},ag'TextLabel'{Text=ak(function()return b(q)end),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,44,0.5,0),Size=UDim2.new(1,-54,0,16),Font=Enum.Font.GothamBold,
BackgroundTransparency=1,TextColor3=d(function()return c.get'text'end,40,1),TextSize=16,TextScaled=true,TextXAlignment=
Enum.TextXAlignment.Left,[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=16}}},ag'UICorner'{CornerRadius=UDim.
new(0,6)}}}},ag'UICorner'{CornerRadius=UDim.new(0,6)},ag'Frame'{ZIndex=2,Size=UDim2.new(1,0,1,0),AnchorPoint=Vector2.
new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),BackgroundTransparency=0.85,BackgroundColor3=d(function()return b(i)end,40,
1),[ai]={ag'UICorner'{CornerRadius=UDim.new(0,6)}}},ag'TextLabel'{BackgroundTransparency=1,Size=UDim2.new(1,-45,0,14),
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,10,0.5,0),Font=Enum.Font.Gotham,TextScaled=true,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0,TextColor3=d(function()return c.get'text'end,40,1),Text=b(j),
[ai]={ag'UITextSizeConstraint'{MinTextSize=1,MaxTextSize=14}}},ag'ImageLabel'{AnchorPoint=Vector2.new(1,0),Position=
UDim2.new(1,-5,0,6),Size=UDim2.fromOffset(28,28),BackgroundTransparency=1,Image=f.emptyBox,ImageColor3=d(function()
return c.get'image'end,40,1),[ai]={ag'UICorner'{CornerRadius=UDim.new(1,0)},ag'ImageLabel'{AnchorPoint=Vector2.new(0.5,
0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image=f.filledBox,ImageColor3=d(
function()return c.get'image'end,40,1),ImageTransparency=d(function()if b(m)then return 0 end return 1 end,30,1),[ai]={
ag'UICorner'{CornerRadius=UDim.new(1,0)}}}}}}},{}function v.Remove(E)u:Destroy()end function v.SetValue(E,F)if typeof(F)
=='boolean'then m:set(F)else error("You didn't give "..b(j)..' a boolean for SetValue')end end function v.Lock(E,F)p:
set(true)q:set(F or'Locked')end function v.Unlock(E)p:set(false)end return v end end)()end,[86]=function()local aa,ab,ac
=a(86)local ad return(function(...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak=af.New,
af.Children,ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.get)return function(al)return ag
'ScrollingFrame'{Name=al.saltedTable[al.Name],Parent=al.Parent,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
ScrollBarThickness=0,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,[ah]={ag'UIListLayout'{
Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment
=Enum.HorizontalAlignment.Center},ag'TextLabel'{Size=UDim2.new(1,0,0,20),Text=al.Name,BackgroundTransparency=1,
TextScaled=true,Font=Enum.Font.GothamMedium,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.75,TextColor3=aj(
function()return ai.get'text'end,40,1),[ah]={ag'UITextSizeConstraint'{MaxTextSize=12,MinTextSize=1},ag'UIPadding'{
PaddingLeft=UDim.new(0,5)}}}}}end end)()end,[88]=function()local aa,ab,ac=a(88)local ad return(function(...)local ae=ab.
Parent.Parent local af,ag=ac(ae.Bundles['ui-utilities']),ac(ae.Bundles.Fusion)local ah,ai,aj,ak,al,b,c,d,e,f,g,h,i,j=ag.
New,ag.OnEvent,ag.Children,ag.Value,ag.Ref,ag.Observer,ag.Computed,ac(ae.utilities.get),ac(ae.utilities.animate),ac(ae.
utilities.matchColors),ac(ae.Bundles.themeSystem),ac(ae.Bundles.icons),game:GetService'UserInputService',game:GetService
'RunService'return function(k)local l,m,p,q,u,v,E,F,G,H=ak(g.get'text'),k.KeyCode,ak(),ak(false),ak(true),ak(false),ak(k
.Size.X),(ak(k.Size.Y))b(v):onChange(function()if not d(v)and H~=nil then H:Disconnect()H=nil end end)local I={}I.
sideBarRef=ak()I.windowsRef=ak()I.uipagelayoutRef=ak()I.notificationListRef=ak()local K,L=ak(),i.InputBegan:Connect(
function(K,L)if not L and K.KeyCode and K.KeyCode==m then u:set(not d(u))end end)G=ah'ScreenGui'{Name=k.saltedTable[k.
Title],Parent=k.Parent,IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=c(function()return d(u)end),[ai'Destroying']=
function()L:Disconnect()H:Disconnect()end,[aj]={ah'Frame'{Name='container',BackgroundTransparency=1,AnchorPoint=Vector2.
new(0,0),Position=UDim2.new(0.5,-d(E)/2,0.5,-d(F)/2),Size=c(function()return UDim2.fromOffset(d(E),45)end),[al]=p,[aj]={
ah'Frame'{AnchorPoint=Vector2.new(0,0),Position=UDim2.fromScale(0,0),ClipsDescendants=true,BackgroundColor3=e(function()
return g.get'background'end,40,1),Size=e(function()if d(q)then return UDim2.fromOffset(d(E),45)end return UDim2.
fromOffset(d(E),d(F))end,20,1),[aj]={ah'UICorner'{CornerRadius=UDim.new(0,6)},ah'Frame'{ZIndex=5,AnchorPoint=Vector2.
new(0,0),Position=UDim2.fromOffset(10,50),Size=UDim2.new(1,0,0,466),ClipsDescendants=true,BackgroundTransparency=1,[aj]=
{ah'ScrollingFrame'{Name='sideBar',AnchorPoint=Vector2.new(0,0),Position=UDim2.fromScale(0,0),Size=UDim2.new(0,40,1,0),
BackgroundTransparency=1,ScrollBarThickness=0,ClipsDescendants=false,ZIndex=0,CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize=Enum.AutomaticSize.Y,[al]=I.sideBarRef,[aj]={ah'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.
SortOrder.LayoutOrder,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left}}}}},
ah'Frame'{Name='topBar',AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),Size=UDim2.new(1,0,0,45),
BackgroundTransparency=1,[aj]={ah'UICorner'{CornerRadius=UDim.new(0,6)},ah'Frame'{AnchorPoint=Vector2.new(0.5,1),
Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1,0,0,1),BackgroundColor3=e(function()return g.get'tertiaryBackground'end
,40,1),BackgroundTransparency=e(function()if d(q)then return 1 else return 0 end end,20,1)},ah'Frame'{Name='taskManage',
BackgroundTransparency=1,AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,0,0.5,0),Size=UDim2.new(0,70,1,0),[aj]={ah
'UIListLayout'{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Center,
VerticalAlignment=Enum.VerticalAlignment.Center},ah'Frame'{Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,[aj]={
ah'TextButton'{Name='toggleMini',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,
0.5),Size=UDim2.fromOffset(30,30),[ai'MouseButton1Click']=function()q:set(not d(q))end,[aj]={ah'ImageLabel'{Name=
'maximizeIcon',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(26,26),Image=h.maximize,ImageColor3=e(function()return g.get'image'end,40,1),ImageTransparency=e(function()if
d(q)then return 0 else return 1 end end,25,1)},ah'ImageLabel'{Name='minimizeIcon',AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,Position=UDim2.fromScale(0.5,0.5),Size=UDim2.fromOffset(26,26),Image=h.minimize,ImageColor3=e(
function()return g.get'image'end,40,1),ImageTransparency=e(function()if d(q)then return 1 else return 0 end end,25,1)}}}
}},ah'TextButton'{Size=UDim2.fromOffset(30,30),BackgroundTransparency=1,Text='',[ai'MouseButton1Click']=function()G:
Destroy()end,[aj]={ah'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromScale(0.95,0.95),BackgroundTransparency=1,Image=h.close,ImageTransparency=0,ImageColor3=e(function()return g.get
'close'end,40,1)}}}}},ah'TextLabel'{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.55),Size=UDim2.
fromOffset(350,25),BackgroundTransparency=1,Font=Enum.Font.GothamBold,TextScaled=true,TextSize=25,TextXAlignment=Enum.
TextXAlignment.Left,Text=k.Title,TextColor3=e(function()if f(d(l),g.get'defaultTab')then return g.get'defaultTab'end
return d(l)end,15,1),[aj]={ah'UIPadding'{PaddingLeft=UDim.new(0,15)},ah'UITextSizeConstraint'{MaxTextSize=25,MinTextSize
=1}}}}},ah'Frame'{Name='windowsContainer',AnchorPoint=Vector2.new(0,0),Size=e(function()return UDim2.new(0,d(E)-70,0,d(F
)-60)end,20,1),Position=UDim2.new(0,60,0,50),BackgroundTransparency=1,ClipsDescendants=true,[al]=I.windowsRef,[aj]={ah
'UIPageLayout'{EasingDirection=Enum.EasingDirection.In,EasingStyle=Enum.EasingStyle.Sine,TweenTime=0.2,FillDirection=
Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,20),[al]=I.uipagelayoutRef}}},ah
'TextButton'{Name='Resizer',AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=UDim2.fromOffset(10,10),
BackgroundTransparency=1,Interactable=c(function()return not d(q)end),[al]=K,[ai'InputBegan']=function(M)if not d(q)and(
M.UserInputType==Enum.UserInputType.MouseButton1 or M.UserInputType==Enum.UserInputType.Touch)then local N,O=d(K),
Vector2.new(9e9,9e9)local P,Q,R=N.AbsolutePosition,d(E),d(F)if H==nil then H=j.Heartbeat:Connect(function()if d(v)then
local S=i:GetMouseLocation()-P if S~=O then O=S E:set(math.clamp(S.X+Q-10,550,9e9))F:set(math.clamp(S.Y+R-10,400,9e9))
end end end)end v:set(true)M.Changed:Connect(function()if M.UserInputState==Enum.UserInputState.End then task.wait()v:
set(false)end end)end end}}}}},ah'ScrollingFrame'{ZIndex=0,AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-5,1,-10),
Size=UDim2.new(0,1,1,-10),BackgroundTransparency=1,ScrollBarThickness=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,
ClipsDescendants=false,[al]=I.notificationListRef,[aj]={ah'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.
LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.Right,VerticalAlignment=Enum.VerticalAlignment.Bottom}}}}}af.
drag(d(p),15)return I,function(M)l:set(M)end end end)()end,[89]=function()local aa,ab,ac=a(89)local ad return(function(
...)local ae=ab.Parent.Parent local af=ac(ae.Bundles.Fusion)local ag,ah,ai,aj,ak,al,b,c,d,e=af.New,af.OnEvent,af.
Children,af.Value,af.Ref,ac(ae.utilities.get),ac(ae.Bundles.themeSystem),ac(ae.utilities.animate),ac(ae.utilities.
matchColors),game:GetService'UserInputService'return function(f)local g,h,i,j,k,l=aj(false),aj(b.get'text'),aj(true),f.
KeyCode,{}k.sideBarRef=aj()k.windowsRef=aj()k.uipagelayoutRef=aj()k.notificationListRef=aj()local m=e.InputBegan:
Connect(function(m,p)if not p and m.KeyCode and m.KeyCode==j then i:set(not al(i))end end)l=ag'ScreenGui'{Name=f.
saltedTable[f.Title],Parent=f.Parent,IgnoreGuiInset=false,ResetOnSpawn=false,[ah'Destroying']=function()m:Disconnect()
end,[ai]={ag'Frame'{Name='container',AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,5,1,-5),ClipsDescendants=true,
BackgroundColor3=c(function()return b.get'background'end,40,1),Size=c(function()if al(g)then return UDim2.new(0.75,0,1,-
10)else return UDim2.fromOffset(40,40)end end,45,1),[ai]={{ag'UICorner'{CornerRadius=UDim.new(0,6)},ag'TextButton'{Name=
'activator',ZIndex=2,AnchorPoint=Vector2.new(0,1),Size=UDim2.fromOffset(40,40),Position=UDim2.fromScale(0,1),
BackgroundTransparency=1,ClipsDescendants=true,[ah'MouseButton1Click']=function()g:set(not al(g))end,[ai]={ag'UICorner'{
CornerRadius=UDim.new(0,6)},ag'ImageLabel'{Name='maximizeIcon',AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1
,Size=UDim2.fromOffset(30,30),Image='rbxassetid://15556636376',ImageColor3=c(function()return b.get'image'end,40,1),
ImageTransparency=c(function()if al(g)then return 1 else return 0 end end,45,1),Position=c(function()if al(g)then return
UDim2.fromScale(0.5,1.5)else return UDim2.fromScale(0.5,0.5)end end,25,1)},ag'ImageLabel'{Name='minimizeIcon',
AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,Size=UDim2.fromOffset(30,30),Image='rbxassetid://15556637715',
ImageColor3=c(function()return b.get'image'end,40,1),ImageTransparency=c(function()if al(g)then return 0 else return 1
end end,45,1),Position=c(function()if al(g)then return UDim2.fromScale(0.5,0.5)else return UDim2.fromScale(0.5,1.5)end
end,25,1)}}},ag'ScrollingFrame'{Name='tabsList',Size=UDim2.new(0,50,1,-80),Position=UDim2.fromOffset(0,40),
BackgroundTransparency=1,ScrollBarThickness=0,ClipsDescendants=false,CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=
Enum.AutomaticSize.Y,[ak]=k.sideBarRef,[ai]={ag'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder
,FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.HorizontalAlignment.Left},ag'UIPadding'{PaddingLeft=
UDim.new(0,10)}}},ag'Frame'{Name='topBar',Size=UDim2.new(1,0,0,40),BackgroundTransparency=1,ZIndex=0,[ai]={ag'TextLabel'
{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.new(1,-40,0,24),BackgroundTransparency=1,Font
=Enum.Font.GothamBold,TextScaled=true,TextSize=24,TextXAlignment=Enum.TextXAlignment.Left,Text=f.Title,TextColor3=c(
function()if d(al(h),b.get'defaultTab')then return b.get'defaultTab'end return al(h)end,15,1),TextTransparency=c(
function()if al(g)then return 0 else return 1 end end,45,1),[ai]={ag'UIPadding'{PaddingLeft=UDim.new(0,10)},ag
'UITextSizeConstraint'{MaxTextSize=24,MinTextSize=1}}},ag'TextButton'{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.
fromScale(1,0.5),Size=UDim2.fromOffset(40,40),BackgroundTransparency=1,Text='',ZIndex=0,[ah'MouseButton1Click']=function
()l:Destroy()end,[ai]={ag'ImageLabel'{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromScale(0.9,0.9),Rotation=45,BackgroundTransparency=1,Image='rbxassetid://15556635005',ImageColor3=c(function()return
b.get'close'end,40,1),ImageTransparency=c(function()if al(g)then return 0 else return 1 end end,45,1)}}}}},ag'Frame'{
Name='windowsList',ZIndex=0,Position=UDim2.fromOffset(50,40),Size=UDim2.new(1,-50,1,-40),BackgroundTransparency=1,
ClipsDescendants=true,[ak]=k.windowsRef,[ai]={ag'UIPadding'{PaddingLeft=UDim.new(0,5),PaddingRight=UDim.new(0,10),
PaddingTop=UDim.new(0,5),PaddingBottom=UDim.new(0,5)},ag'UIPageLayout'{Name='UIPageLayout',EasingDirection=Enum.
EasingDirection.In,EasingStyle=Enum.EasingStyle.Sine,TweenTime=0.2,FillDirection=Enum.FillDirection.Vertical,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,20),[ak]=k.uipagelayoutRef}}}}}},ag'ScrollingFrame'{Name='notifications',
ZIndex=0,AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,-5,1,-10),Size=UDim2.new(0,1,1,-10),BackgroundTransparency=1,
ScrollBarThickness=0,AutomaticCanvasSize=Enum.AutomaticSize.Y,ClipsDescendants=false,[ak]=k.notificationListRef,[ai]={ag
'UIListLayout'{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.HorizontalAlignment.
Right,VerticalAlignment=Enum.VerticalAlignment.Bottom}}}}}return k,function(p)h:set(p)end end end)()end,[90]=function()
local aa,ab,ac=a(90)local ad return(function(...)return{defaultTab=Color3.fromHex'#a49ae6',background=Color3.fromRGB(40,
44,50),secondaryBackground=Color3.fromRGB(49,56,66),tertiaryBackground=Color3.fromRGB(57,63,75),text=Color3.fromRGB(220,
221,225),image=Color3.fromRGB(220,221,225),placeholder=Color3.fromRGB(165,166,169),close=Color3.fromRGB(190,100,105)}end
)()end,[91]=function()local aa,ab,ac=a(91)local ad return(function(...)end)()end,[93]=function()local aa,ab,ac=a(93)
local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af,ag=ae.Computed,ae.Spring return
function(ah,ai,aj)return ag(af(ah),ai,aj)end end)()end,[94]=function()local aa,ab,ac=a(94)local ad return(function(...)
return function(ae,af)if typeof(ae)=='table'and ae.type=='State'then return ae:get(af)end return ae end end)()end,[95]=
function()local aa,ab,ac=a(95)local ad return(function(...)return function(ae:string,af)ae=ae or''af=af or{TextSize=14,
Font=Enum.Font.Arial,VectorSize=Vector2.new(200,50)}local ag=game:GetService'TextService'return ag:GetTextSize(ae,af.
TextSize,af.Font,af.VectorSize)end end)()end,[96]=function()local aa,ab,ac=a(96)local ad return(function(...)local ae,af
=Color3.new(0,0,0),Color3.new(1,1,1)return function(ag:Color3,ah:string,ai:number)local aj=string.lower(ah)if ah==
'black'then return ag:Lerp(ae,ai)elseif ah=='white'then return ag:Lerp(af,ai)else return error
'hey its not white or black'end end end)()end,[97]=function()local aa,ab,ac=a(97)local ad return(function(...)return
function(ae,af)if ae.R==af.R and ae.G==af.G and ae.B==af.B then return true end return false end end)()end,[98]=function
()local aa,ab,ac=a(98)local ad return(function(...)local ae=ac(ab.Parent.Parent.Bundles.Fusion)local af=ae.Computed
return function(ag,ah)return ae.Tween(af(ag),ah)end end)()end},{{1,2,{'quake'},{{72,1,{'components'},{{82,2,{'newSlider'
}},{85,2,{'newToggle'}},{86,2,{'newWindow'}},{75,2,{'newDropdown'}},{83,2,{'newTab'}},{84,2,{'newTextBox'}},{80,2,{
'newParagraph'}},{78,2,{'newLabel'}},{81,2,{'newSection'}},{74,2,{'newColorPicker'}},{79,2,{'newNotification'}},{73,2,{
'newButton'}},{77,2,{'newKeybind'}},{76,2,{'newGroup'}}}},{87,1,{'platforms'},{{89,2,{'mobile'}},{88,2,{'computer'}}}},{
2,1,{'Bundles'},{{69,2,{'themeSystem'},{{70,2,{'themes'}}}},{3,2,{'Fusion'},{{16,1,{'Dependencies'},{{18,2,{
'initDependency'}},{17,2,{'captureDependencies'}},{20,2,{'updateAll'}},{21,2,{'useDependency'}},{19,2,{'sharedState'}}}}
,{48,2,{'Types'}},{33,1,{'Logging'},{{38,2,{'parseError'}},{36,2,{'logWarn'}},{37,2,{'messages'}},{34,2,{'logError'}},{
35,2,{'logErrorNonFatal'}}}},{49,1,{'Utility'},{{51,2,{'cleanup'}},{53,2,{'isSimilar'}},{50,2,{'None'}},{55,2,{
'restrictRead'}},{54,2,{'needsDestruction'}},{56,2,{'xtypeof'}},{52,2,{'doNothing'}}}},{40,1,{'State'},{{44,2,{
'ForValues'}},{43,2,{'ForPairs'}},{47,2,{'unwrap'}},{42,2,{'ForKeys'}},{41,2,{'Computed'}},{46,2,{'Value'}},{45,2,{
'Observer'}}}},{14,1,{'Colour'},{{15,2,{'Oklab'}}}},{39,2,{'PubTypes'}},{4,1,{'Animation'},{{9,2,{'getTweenRatio'}},{11,
2,{'packType'}},{5,2,{'Spring'}},{6,2,{'SpringScheduler'}},{10,2,{'lerpType'}},{8,2,{'TweenScheduler'}},{12,2,{
'springCoefficients'}},{7,2,{'Tween'}},{13,2,{'unpackType'}}}},{22,1,{'Instances'},{{32,2,{'defaultProps'}},{24,2,{
'Cleanup'}},{30,2,{'Ref'}},{23,2,{'Children'}},{28,2,{'OnEvent'}},{31,2,{'applyInstanceProps'}},{26,2,{'New'}},{27,2,{
'OnChange'}},{29,2,{'Out'}},{25,2,{'Hydrate'}}}}}},{71,2,{'ui-utilities'}},{68,2,{'icons'}},{57,2,{'betterMathModule'},{
{58,3,{'CLASS_Value'}},{66,3,{'Class_Special'}},{65,3,{'CLASS_Random'}},{60,3,{'CLASS_String'}},{61,3,{'CLASS_Convert'}}
,{67,3,{'CLASS_Chance'}},{59,3,{'CLASS_Sequence'}},{64,3,{'CLASS_Matrix'}},{63,3,{'CLASS_Notation'}},{62,3,{
'CLASS_Check'}}}}}},{90,2,{'preservedConfig'}},{92,1,{'utilities'},{{93,2,{'animate'}},{95,2,{'getStringBounds'}},{96,2,
{'lerpColor'}},{94,2,{'get'}},{98,2,{'tween'}},{97,2,{'matchColors'}}}},{91,2,{'project.story'}}}}},'0.4.1','WaxRuntime'
,string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local j
,k,l,m,p,q,u=aj.insert,aj.remove,aj.freeze or function(j)return j end,al.wrap,ae.sub,ae.match,ae.gmatch if h and p(h,1,4
)=='Lune'then local v,E=e(d,'@lune/task')if v and E then af=E end end local v=af and af.defer local E,F,G,H,I,K,L,M,N=v
or function(E,...)m(E)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},
{},{},{},{},{}local O,P={GetFullName={{},function(O)local P,Q=O.Name,O.Parent while Q do P=Q.Name..'.'..P Q=Q.Parent end
return P end},GetChildren={{},function(O)local P={}for Q in ai,N[O]do j(P,Q)end return P end},GetDescendants={{},
function(O)local P={}for Q in ai,N[O]do j(P,Q)for R,S in ai,Q:GetDescendants()do j(P,S)end end return P end},
FindFirstChild={{'string','boolean?'},function(O,P,Q)local R=N[O]for S in ai,R do if S.Name==P then return S end end if
Q then for T in ai,R do return T:FindFirstChild(P,true)end end end},FindFirstAncestor={{'string'},function(O,P)local Q=O
.Parent while Q do if Q.Name==P then return Q end Q=Q.Parent end end},WaitForChild={{'string','number?'},function(O,P)
return O:FindFirstChild(P)end}},{}for Q,R in ai,O do local S,T,U=R[1],R[2],{}for V,W in ai,S do local Z,_=q(W,
'^([^%?]+)(%??)')U[V]={Z,_}end P[Q]=function(Z,...)if not N[Z]then ah("Expected ':' not '.' calling member function "..Q
,2)end local _={...}for am,an in ai,U do local ao=_[am]local ap,aq,ar=c(ao),an[1],an[2]if ao==nil and not ar then ah(
'Argument '..ao..' missing or nil',3)end if aq~='any'and ap~=aq and not(ap=='nil'and ar)then ah('Argument '..am..
' expects type "'..aq..'", got "'..ap..'"',2)end end return T(Z,...)end end local function am(an,ao,ap)local aq,ar=(ag({
},{__mode='k'}))local function S(T)ah(T..' is not a valid (virtual) member of '..an..' "'..ao..'"',3)end local function
T(U)ah('Unable to assign (virtual) property '..U..'. Property is read only',3)end local U,V={},{}V.__metatable=false V.
__index=function(W,Z)if Z=='ClassName'then return an elseif Z=='Name'then return ao elseif Z=='Parent'then return ap
elseif an=='StringValue'and Z=='Value'then return ar else local _=P[Z]if _ then return _ end end for _ in ai,aq do if _.
Name==Z then return _ end end S(Z)end V.__newindex=function(W,Z,_)if Z=='ClassName'then T(Z)elseif Z=='Name'then ao=_
elseif Z=='Parent'then if _==U then return end if ap~=nil then N[ap][U]=nil end ap=_ if _~=nil then N[_][U]=true end
elseif an=='StringValue'and Z=='Value'then ar=_ else S(Z)end end V.__tostring=function()return ao end ag(U,V)N[U]=aq if
ap~=nil then N[ap][U]=true end return U end local function an(ao,ap)local aq,ar,S,T=ao[1],ao[2],ao[3],ao[4]local U=F[ar]
local V=S and k(S,1)or U local W=am(U,V,ap)G[aq]=W if S then for Z,_ in ai,S do W[Z]=_ end end if T then for Z,_ in ai,T
do an(_,W)end end return W end local ao=am('Folder','['..ad..']')for ap,aq in ai,ab do an(aq,ao)end for ar,S in ai,aa do
local T=G[ar]H[T]=S I[T]=ar local U=T.ClassName if U=='LocalScript'or U=='Script'then j(L,T)end end local function T(U)
local V,W=U.ClassName,K[U]if W and V=='ModuleScript'then return ak(W)end local Z=H[U]local function _(as)as=f(as)local
at,au,av=U:GetFullName(),q(as,'[^:]+:(%d+): (.+)')if not au or not i then return at..':*: '..(av or as)end au=g(au)local
aw=I[U]local ax=i[aw]local ay=au-ax+1 if ay<0 then ay='?'end return at..':'..ay..': '..av end if V=='LocalScript'or V==
'Script'then local as,at=e(Z)if not as then ah(_(at),0)end else local as={e(Z)}local at=k(as,1)if not at then local au=
k(as,1)ah(_(au),0)end K[U]=as return ak(as)end end function a(as)local at=G[as]local function au(av,...)local aw={e(av,
...)}local ax=k(aw,1)if not ax then ah(aw[1],3)end return ak(aw)end local av=l(ag({},{__index=M,__newindex=function(av,
aw,ax)M[aw]=ax end,__len=function()return#M end,__iter=function()return ai,M end}))local aw,ax=l{version=ac,envname=ad,
shared=av,script=b,require=d},at local function ay(U,...)local V,W,Z=c(U),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if V=='table'and N[U]then if U.
ClassName~='ModuleScript'then ah(W,2)elseif U==at then ah(Z,2)end return T(U)elseif V=='string'and p(U,1,1)~='@'then if#
U==0 then ah('Attempted to call require with empty string',2)end local _=at if p(U,1,1)=='/'then _=ao elseif p(U,1,2)==
'./'then U=p(U,3)end local az for aA in u(U,'([^/]*)/?')do local aB=aA if aA=='..'then aB='Parent'end if aB~=''then
local aC=_:FindFirstChild(aB)if not aC then local aD=_.Parent if aD then aC=aD:FindFirstChild(aB)end end if aC then _=aC
elseif aA~=az and aA~='init'and aA~='init.server'and aA~='init.client'then ah('Virtual script path "'..U..'" not found',
2)end end az=aA end if _.ClassName~='ModuleScript'then ah(W,2)elseif _==at then ah(Z,2)end return T(_)end return au(d,U,
...)end return aw,ax,ay end for as,at in ai,L do E(T,at)end return T(ao:GetChildren()[1])
