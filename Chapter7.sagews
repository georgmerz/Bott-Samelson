#This script runs computations necessary for chapter 7

# global Okounkov body for E_3:
globalokounkovsurface=Polyhedron(vertices=[(0,0,0,0)],rays=[(1,0,0,1),(0,0,1,0),(0,1,1,0),(0,0,1,1)])
nefslice=Polyhedron(lines=[(1,0,0,0),(0,1,0,0)],rays=[(0,0,1,0),(0,0,1,1)])

#Nef Part of global NOby which is C(S_1)
nefglobalno=nefslice.intersection(globalokounkovsurface)
nefglobalno.Hrepresentation()

# this is q^{-1}(C(S_1)) we have lifted the defining equations
Cs=Polyhedron(ieqs=[(0,0,-1,0,0,1,-1),(0,0,1,0,0,0,0),(0,0,0,0,1,-1,2),(0,0,0,1,0,0,0),(0,0,1,-1,1,-1,2)])

# this is C(S)
Cs=Cs.intersection(Polyhedron(rays=[(0,0,0,1,0,0),(0,0,0,1,1,0),(0,0,0,0,1,1),(0,1,0,0,0,0),(0,0,1,0,0,0)]))
print("Ray Generators")
Cs.Vrepresentation()


# for global Noby we must add one more ray
globalok=Cs+Polyhedron(vertices=[(0,0,0,0,0,0)],rays=[(1,0,0,0,0,1),(0,1,0,0,1,0)])
schubertglobal=globalok.intersection(Polyhedron(vertices=[(0,0,0,0,0,0)],rays=[(1,0,0,0,0,0),(0,1,0,0,0,0),(0,0,1,0,0,0),(0,0,0,1,1,0),(0,0,0,0,1,1)]))
schubertglobal.Vrepresentation()
Cone(schubertglobal).Hilbert_basis()

#local example

def getlocalNOby(globalok,D):
    # functions that computes local NO body corresponding to D from global one
    dpolytope=Polyhedron(ieqs=[(-D[0],0,0,0,1,0,0),(D[0],0,0,0,-1,0,0),(-D[1],0,0,0,0,1,0),(D[1],0,0,0,0,-1,0),(-D[2],0,0,0,0,0,1),(D[2],0,0,0,0,0,-1)])
    dpolytope.Hrepresentation()
    return dpolytope.intersection(globalok)

