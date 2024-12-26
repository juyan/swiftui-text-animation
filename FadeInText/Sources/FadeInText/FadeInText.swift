import SwiftUI


public struct FadeInText: View {
    
  @StateObject var controller: FadeInTextController
  
  public init(text: String, color: Color, tokenizer: Tokenizer, interpolator: Interpolator) {
    self._controller = StateObject(
      wrappedValue: FadeInTextController(
        rawText: text,
        color: color,
        tokenizer: tokenizer,
        interpolator: interpolator
      )
    )
  }
    
  public var body: some View {
    Text(controller.text)
      .onAppear(perform: {
        controller.startAnimation()
      })
  }
}


#Preview("English") {
  FadeInText(
    text: "Hello! Welcome to FadeInText. The text will fade in smoothly. You are able to tweak the fade in duration by passing a configuration. Enjoy the animation.",
    color: .black,
    tokenizer: DefaultTokenizer(),
    interpolator: LinearInterpolator(config: .defaultValue)
  )
  .font(.title2)
  .padding(16)
}

#Preview("English-Slow") {
  FadeInText(
    text: "Hello! Welcome to FadeInText. The text will fade in smoothly. You are able to tweak the fade in duration by passing a configuration. Enjoy the animation.",
    color: .black,
    tokenizer: DefaultTokenizer(),
    interpolator: LinearInterpolator(config: .init(fadeInDuration: 2.0, appearanceDuration: 5.0))
  )
  .font(.title2)
  .padding(16)
}

#Preview("Chinese") {
  FadeInText(
    text: "壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。",
    color: .black,
    tokenizer: DefaultTokenizer(),
    interpolator: LinearInterpolator(config: .defaultValue)
  )
  .font(.title2)
  .padding(16)
}