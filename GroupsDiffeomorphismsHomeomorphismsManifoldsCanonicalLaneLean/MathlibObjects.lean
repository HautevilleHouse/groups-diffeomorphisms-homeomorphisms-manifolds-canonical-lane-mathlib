import GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure DifferentiableManifold where
  carrier : Type
  topology : TopologicalSpace carrier
  smoothAtlas : Set (Set carrier → carrier)
  smoothCompatible : Prop

structure DiffeomorphismAdmittedObject where
  manifold : DifferentiableManifold
  compact : Prop
  boundaryless : Prop
  target : Type
  targetTopology : TopologicalSpace target
  diffeomorphicToTarget : Prop
  conclusion : diffeomorphicToTarget

structure DiffeomorphismEndgameState where
  object : DiffeomorphismAdmittedObject

def DiffeomorphismWitnessClosed (O : DiffeomorphismAdmittedObject) : Prop :=
  O.diffeomorphicToTarget

end GroupsDiffeomorphismsHomeomorphismsManifoldsCanonicalLaneLean
end HautevilleHouse