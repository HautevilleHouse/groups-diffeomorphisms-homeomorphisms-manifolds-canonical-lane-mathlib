import GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure SmoothAtlas (M : Type) extends TopologicalSpace M where
  charts : Set (Set M)
  transitionMapsSmooth : ∀ c1 c2 ∈ charts, Smooth (c1 ∩ c2) (c2 ∩ c1) (fun x => x)
  covering : ∀ x : M, ∃ c ∈ charts, x ∈ c

structure DiffeomorphismBetweenManifolds (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [SmoothManifold M] [SmoothManifold N] where
  underlyingMap : M → N
  continuous : Continuous underlyingMap
  smooth : Smooth M N underlyingMap
  bijective : Function.Bijective underlyingMap
  smoothInverse : Smooth N M (Function.invFun underlyingMap)

structure Diffeotopy (M N : Type) [TopologicalSpace M] [TopologicalSpace N] [SmoothManifold M] [SmoothManifold N] where
  family : ℝ → (M → N)
  t0 : ℝ
  t1 : ℝ
  atEachT : ∀ t ∈ Set.Icc t0 t1, DiffeomorphismBetweenManifolds M N (family t)
  smoothInParameter : Smooth (ℝ × M) N (fun (t,x) => family t x)

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse
