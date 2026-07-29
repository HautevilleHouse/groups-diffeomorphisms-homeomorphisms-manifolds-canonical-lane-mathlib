import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure ExponentialMapPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    (G : DiffeomorphismGroupPackage M) where
  lieAlgebra : Type v
  exponentialMap : Type w
  definedOnWholeAlgebra : Prop
  smoothExponential : Prop
  oneParameterSubgroups : Prop

structure ExponentialMapEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (E : ExponentialMapPackage G) where
  definedOnWholeAlgebraClosed : E.definedOnWholeAlgebra
  smoothExponentialClosed : E.smoothExponential
  oneParameterSubgroupsClosed : E.oneParameterSubgroups

def ExponentialMapClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (E : ExponentialMapPackage G) : Prop :=
  E.definedOnWholeAlgebra ∧ E.smoothExponential ∧ E.oneParameterSubgroups

theorem exponential_map_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (E : ExponentialMapPackage G)
    (Ev : ExponentialMapEvidence E) : ExponentialMapClosed E := by
  exact And.intro Ev.definedOnWholeAlgebraClosed
    (And.intro Ev.smoothExponentialClosed Ev.oneParameterSubgroupsClosed)

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse
