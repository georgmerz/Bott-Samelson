#This script refers to computations necessary for Chapter 5 Examples

D_1=vector(QQ,[1,0,0,0])
D_2=vector(QQ,[1,1,0,0])
D_3=vector(QQ,[0,1,1,0])
D_4=vector(QQ,[0,1,1,1])
eff=Polyhedron(vertices=[(0,0,0,0)],rays=([vector(QQ,[1,0,0,0]),vector(QQ,[0,1,0,0]),vector(QQ,[0,0,1,0]),vector(QQ,[0,0,1,0]),vector(QQ,[0,0,0,1])]))
nef=Polyhedron(vertices=[(0,0,0,0)],rays=([vector(QQ,[1,0,0,0]),vector(QQ,[1,1,0,0]),vector(QQ,[0,1,1,0]),vector(QQ,[0,1,1,1])]))
extremal_not_nef=[vector(QQ,[0,1,0,0]),vector(QQ,[0,0,1,0]),vector(QQ,[0,0,0,1])]
nefhrep=nef.Hrepresentation()
#compute all chambers
chamber1=nef.faces(3)[0].as_polyhedron()+Polyhedron(vertices=[(0,0,0,0)],rays=[(0,1,0,0)])
chamber2=nef.faces(3)[2].as_polyhedron()+Polyhedron(vertices=[(0,0,0,0)],rays=[(0,0,1,0)])
chamber3=nef.faces(3)[3].as_polyhedron()+Polyhedron(vertices=[(0,0,0,0)],rays=[(0,0,0,1)])
chamber4=nef.faces(3)[3].as_polyhedron().intersection(nef.faces(3)[2].as_polyhedron())+Polyhedron(vertices=[(0,0,0,0)],rays=[(0,0,0,1),(0,0,1,0)])
chamber5=nef.faces(3)[0].as_polyhedron().intersection(nef.faces(3)[3].as_polyhedron())+Polyhedron(vertices=[(0,0,0,0)],rays=[(0,0,0,1),(0,1,0,0)])
#Generic Hyperplane
Hyperplane=Polyhedron(ieqs=[(-1,1,1,1,1),(1,-1,-1,-1,-1)])
#Now slice alle chambers with Generic Hyperplane
print("chamber 1")
chamber1.intersection(Hyperplane).vertices()
print("chamber 2")
chamber2.intersection(Hyperplane).vertices()
print("chamber 3")
chamber3.intersection(Hyperplane).vertices()
print("chamber 4")
chamber4.intersection(Hyperplane).vertices()
print("chamber 5")
chamber5.intersection(Hyperplane).vertices()
print("chamber 6")
