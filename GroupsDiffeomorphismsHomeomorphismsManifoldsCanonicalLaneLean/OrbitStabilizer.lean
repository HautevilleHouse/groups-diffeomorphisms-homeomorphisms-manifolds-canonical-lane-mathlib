import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

structure OrbitStabilizerPackage {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} (A : GroupActionPackage G) where
  orbitType : Type v
  stabilizerType : Type w
  orbitManifoldStructure : Prop
  stabilizerSubgroup : Prop
  orbitStabilizerTheorem : Prop

structure OrbitStabilizerEvidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} {A : GroupActionPackage G}
    (O : OrbitStabilizerPackage A) where
  orbitManifoldStructureClosed : O.orbitManifoldStructure
  stabilizerSubgroupClosed : O.stabilizerSubgroup
  orbitStabilizerTheoremClosed : O.orbitStabilizerTheorem

def OrbitStabilizerClosed {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} {A : GroupActionPackage G}
    (O : OrbitStabilizerPackage A) : Prop :=
  O.orbitManifoldStructure ∧ O.stabilizerSubgroup ∧ O.orbitStabilizerTheorem

theorem orbit_stabilizer_closed_from_evidence {M : Type u} [TopologicalSpace M] [SmoothManifold M]
    {G : DiffeomorphismGroupPackage M} {A : GroupActionPackage G}
    (O : OrbitStabilizerPackage A) (E : OrbitStabilizerEvidence O) :
    OrbitStabilizerClosed O := by
  exact And.intro E.orbitManifoldStructureClosed
    (And.intro E.stabilizerSubgroupClosed E.orbitStabilizerTheoremClosed)

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse
