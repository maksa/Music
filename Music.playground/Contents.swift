import UIKit

enum Intervals : Int {
    case P1 = 0
    case m2 = 1
    case M2 = 2
    case m3 = 3
    case M3 = 4
    case P4 = 5
    case P5 = 7
    case m6 = 8
    case M6 = 9
    case m7 = 10
    case M7 = 11
    case P = 12
}

enum Step : Int {
    case HALF = 1
    case WHOLE = 2
}

func toneAtPosition( i : Int, _ allthetones : [String] ) -> String {
    return allthetones[ i % (allthetones.count) ]
}


func scaleWithIntervals( note: String, _ tones: [ String ], _ intervals: [Step] ) -> [ String ]{
    var index = tones.firstIndex(of: note)!
    var scale : [ String ] = []
    for i in 0...6 {
        let tone = toneAtPosition( i:index, tones )
        scale.append( tone )
        index = index + intervals[i].rawValue
    }
    return scale
}

func majorScale( note: String, _ tones: [ String ] ) -> [ String ] {
    return scaleWithIntervals(note: note, tones, [ .WHOLE, .WHOLE, .HALF, .WHOLE, .WHOLE, .WHOLE, .HALF ] )
}
func minorScale( note: String, _ tones: [ String ] ) -> [ String ] {
    return scaleWithIntervals(note: note, tones, [ .WHOLE, .HALF, .WHOLE, .WHOLE, .HALF, .WHOLE, .WHOLE ] )
}

func chordsInScale( scale: String,_ tones: [String] ) -> [ String ]{
    let tonesInScale = majorScale( note: scale, tones )
    let majorminor = [ "dur", "mol", "mol", "dur", "dur", "mol", "dim" ]
    var chords : [ String ] = []
    for (index, tone) in tonesInScale.enumerated() {
        let chord = tone + "-" + majorminor[index]
        chords.append(chord)
    }
    return chords
}

func makeMajorChord( note: String, _ tones: [ String ] ) -> ( String, String, String ) {
    let scale = majorScale( note: note, tones )
    return ( scale[0], scale[2], scale[4] )
}

func makeminorChord( note: String, _ tones: [ String ] ) -> ( String, String, String ) {
    let scale = minorScale( note: note, tones )
    return ( scale[0], scale[2], scale[4] )
}
// ♭ ♯

var tonovi = [ "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "H" ]

majorScale(note: "C", tonovi )
majorScale(note: "D", tonovi )
majorScale(note: "E", tonovi )
majorScale(note: "F", tonovi )
majorScale(note:"G", tonovi )
majorScale(note:"A", tonovi )

minorScale(note:"A", tonovi )
// dur, mol, mol, dur, dur, mol, dim

chordsInScale( scale: "C", tonovi )
chordsInScale( scale:"D", tonovi )
chordsInScale( scale: "E", tonovi )
chordsInScale( scale:"F", tonovi )
chordsInScale( scale:"G", tonovi )
chordsInScale( scale:"A", tonovi )

makeMajorChord( note:"C", tonovi )
makeMajorChord( note:"D", tonovi )
makeMajorChord( note:"E", tonovi )
makeMajorChord( note:"F", tonovi )
makeMajorChord( note:"G", tonovi )

makeminorChord( note:"C", tonovi )
makeminorChord( note:"D", tonovi )
makeminorChord( note:"E", tonovi )
makeminorChord( note:"F", tonovi )
makeminorChord( note:"G", tonovi )


