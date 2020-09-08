import React from "react"

class HeaderGuest extends React.Component {
    constructor(props) {
        super(props);
        this.state={
            isMenuOpen: false,
            imageHamburgerButton: "hamburger-open",
            pullDownMenu: "close-menu"
        };
    }

    onClickHamburger(){
        this.setState({isMenuOpen:!this.state.isMenuOpen});
        this.setState({imageHamburgerButton: this.state.isMenuOpen ? "hamburger-open" : "hamburger-close"});
        this.setState({pullDownMenu: this.state.isMenuOpen ? "close-menu" : "open-menu-guest"})
    }

    render() {
        return(
            <div>
                <button className={`hamburger-button ${this.state.imageHamburgerButton}`} onClick={()=>{this.onClickHamburger()}}>
                </button>
                <div className={`pull-down-menu ${this.state.pullDownMenu}`}>
                    <div className={'pull-down-user'}>
                        <a href={'/signup'}>ログイン</a>
                    </div>
                </div>
            </div>
        );
    }
}

export default HeaderGuest
