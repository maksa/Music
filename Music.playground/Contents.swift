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
    var index = tones.indexOf(note)!
    var scale : [ String ] = []
    for i in 0...6 {
        let tone = toneAtPosition( index, tones )
        scale.append( tone )
        index = index + intervals[i].rawValue
    }
    return scale
}

func majorScale( note: String, _ tones: [ String ] ) -> [ String ] {
    return scaleWithIntervals(note, tones, [ .WHOLE, .WHOLE, .HALF, .WHOLE, .WHOLE, .WHOLE, .HALF ] )
}
func minorScale( note: String, _ tones: [ String ] ) -> [ String ] {
    return scaleWithIntervals(note, tones, [ .WHOLE, .HALF, .WHOLE, .WHOLE, .HALF, .WHOLE, .WHOLE ] )
}

func chordsInScale( scale: String,_ tones: [String] ) -> [ String ]{
    let tonesInScale = majorScale( scale, tones )
    let majorminor = [ "dur", "mol", "mol", "dur", "dur", "mol", "dim" ]
    var chords : [ String ] = []
    for (index, tone) in tonesInScale.enumerate() {
        let chord = tone + "-" + majorminor[index]
        chords.append(chord)
    }
    return chords
}

func makeMajorChord( note: String, _ tones: [ String ] ) -> ( String, String, String ) {
    let scale = majorScale( note, tones )
    return ( scale[0], scale[2], scale[4] )
}

func makeminorChord( note: String, _ tones: [ String ] ) -> ( String, String, String ) {
    let scale = minorScale( note, tones )
    return ( scale[0], scale[2], scale[4] )
}


// ♭ ♯

var tonovi = [ "C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "H" ]

majorScale("C", tonovi )
majorScale("D", tonovi )
majorScale("E", tonovi )
majorScale("F", tonovi )
majorScale("G", tonovi )
majorScale("A", tonovi )

minorScale("A", tonovi )
// dur, mol, mol, dur, dur, mol, dim

chordsInScale( "C", tonovi )
chordsInScale( "D", tonovi )
chordsInScale( "E", tonovi )
chordsInScale( "F", tonovi )
chordsInScale( "G", tonovi )
chordsInScale( "A", tonovi )

makeMajorChord( "C", tonovi )
makeMajorChord( "D", tonovi )
makeMajorChord( "E", tonovi )
makeMajorChord( "F", tonovi )
makeMajorChord( "G", tonovi )

makeminorChord( "C", tonovi )
makeminorChord( "D", tonovi )
makeminorChord( "E", tonovi )
makeminorChord( "F", tonovi )
makeminorChord( "G", tonovi )


